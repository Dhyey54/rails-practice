class Faculty < ApplicationRecord
  include ActiveModel::Validations
  include CallbackMethod
  include EmailCallback

  validates :first_name, :last_name, presence: { message: "%{attribute} must be given please" }
  validates_with DateValidator
  validates :designation, exclusion: { in: ["HOD", "Sr. Prof."], message: "HOD or Sr. Prof. as value is not allowed" },
    inclusion: { in: ["Ass. Prof.", "Prof."], message: "%{value} for %{attribute} is not allowed. Designation can only be Ass. Prof. or Prof." },
    presence: true
  
  with_options presence: true do
    validates :email, uniqueness: true
    validates :phone_number, numericality: { only_integer: true }, length: { is: 10 }
  end

  # Different callbacks available
  after_initialize :callback_after_initialize
  after_find :callback_after_find
  # Validation Callback
  before_validation :callback_before_validation
  after_validation :callback_after_validation, :age_callback
  # Save Callback
  before_save :callback_before_saving, :email_callback
  around_save :callback_around_saving
  after_save :callback_after_save
  # Rollback Callback
  after_rollback :callback_after_rollback
  # Create Callbacks
  before_create :callback_before_create
  after_create :callback_after_create
  around_create :callback_around_create
  # Update Callbacks
  before_update :callback_before_update, :update_counter
  after_update :callback_after_update
  around_update :callback_around_update
  # Destroy Callbacks
  before_destroy :callback_before_destroy
  around_destroy :callback_around_destroy
  after_destroy :callback_after_destroy
  # Commit Callback
  after_commit :callback_after_commit, on: [ :create, :update, :destroy]
  # Different Commit Callback
  after_create_commit :callback_after_create_commit
  after_update_commit :callback_update_create_commit
  after_destroy_commit :callback_destroy_create_commit

  def callback_after_create_commit
    counter = Faculty.count
    puts "There are #{counter} faculties"
  end

  def update_counter
    self.update_faculty_count += 1
  end

  def callback_update_create_commit
    puts "This faculty has been updated for #{update_faculty_count} times"
  end

  def callback_destroy_create_commit
    puts "Faculty #{first_name} #{last_name} is removed from system."
  end

  def age_callback
    self.age = Date.today.year - self.birthdate.year
  end

end
