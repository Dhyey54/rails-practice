class Product < ApplicationRecord
  # Single Line Validation  
  validates :code, length: { is: 4 }
  validates :name, length: { minimum: 3 }
  validates :code, :name, presence: true
  validates :code, uniqueness: true
  
  # Custom Validation
  validate :defective
  
  # Different callbacks available
  before_validation :callback_before_validation
  after_validation :callback_after_validation
  before_save :callback_before_saving
  around_save :callback_around_saving
  after_rollback :callback_after_rollback
  before_create :callback_before_create
  after_create :callback_after_create
  around_create :callback_around_create
  after_save :callback_after_save
  before_update :callback_before_update
  after_update :callback_after_update
  around_update :callback_around_update
  before_destroy :callback_before_destroy
  around_destroy :callback_around_destroy
  after_destroy :callback_after_destroy
  after_commit :callback_after_commit
  
  # Method used in custom validation.
  def defective
    if self.defected == true
      puts "Product is defective"
    else
      puts "Product is not defective"
      false
    end
  end

  # Methods used in different callbacks
  def callback_before_validation
    puts "Callback called before validation"
  end

  def callback_after_validation
    puts "Callback called after validation"
  end

  def callback_before_saving
    puts "Callback called before saving"
  end

  def callback_around_saving
    puts "Callback inside around_save(before)"
    yield
    puts "Callback inside around save(after)"
  end

  def callback_after_rollback
    puts "Callback after rollback"
  end

  def callback_before_create
    puts "Callback before create"
  end

  def callback_after_create
    puts "Callback after create"
  end

  def callback_around_create
    puts "Callback around create(before)"
    puts "Callback around create(after)"
  end

  def callback_after_save
    puts "Callback after save"
  end

  def callback_before_update
    puts "Callback before update"
  end

  def callback_after_update
    puts "Callback after update"
  end

  def callback_around_update
    puts "Callback around update(before)"
    yield
    puts "Callback around update(after)"
  end

  def callback_before_destroy
    puts "Callback before destroy"
  end

  def callback_after_destroy
    puts "Callback after destroy"
  end

  def callback_around_destroy
    puts "Callback around destroy(before)"
    yield
    puts "Callback around destroy(after)"
  end

  def callback_after_commit
    puts "Callback after commit"
  end
end
