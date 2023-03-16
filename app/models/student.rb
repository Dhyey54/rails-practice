class Student < ApplicationRecord
  include ActiveModel::Validations
  include CallbackMethod
  include EmailCallback

  validates :first_name, :last_name, presence: { message: "%{attribute} must be given please" }
  validates :email, presence: true
  validates :department, presence: true, department: true
  validates :terms_of_usage, acceptance: { message: 'Terms of usage must be accepted to continue' }
  validates_with DateValidator

  # Different callbacks available
  after_initialize :callback_after_initialize
  after_find :callback_after_find
  # Validation Callback
  before_validation :callback_before_validation, :default_birthdate_callback
  after_validation :callback_after_validation
  # Save Callback
  before_save :callback_before_saving, :email_callback
  around_save :callback_around_saving
  after_save :callback_after_save
  # Create Callback
  before_create :callback_before_create
  around_create :callback_around_create
  after_create :callback_after_create
  # Rollback Callback
  after_rollback :callback_after_rollback
  # Update Callback
  before_update :callback_before_update, :update_counter
  around_update :callback_around_update
  after_update :callback_after_update, if: :is_deleted?
  # Destroy Callback
  around_destroy :callback_around_destroy
  before_destroy :callback_before_destroy
  after_destroy :callback_after_destroy
  # Commit Callback
  after_commit :callback_after_commit, on: [ :create, :update, :destroy]
  # Different Commit Callback
  after_create_commit :callback_after_create_commit
  after_update_commit :callback_update_create_commit
  after_destroy_commit :callback_destroy_create_commit

  def callback_after_create_commit
    counter = Student.count
    puts "There are #{counter} students"
  end

  def update_counter
    self.update_student_count += 1
  end

  def callback_update_create_commit
    puts "This student has been updated for #{update_student_count} times"
  end

  def callback_destroy_create_commit
    puts "Student #{first_name} #{last_name} is removed from system."
  end



  def default_birthdate_callback
    self.birthdate = "01-01-1990" if birthdate.blank?
  end

  def is_deleted?
    !Student.exists?(id)
  end

end
