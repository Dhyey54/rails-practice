class Product < ApplicationRecord
  validates :code, length: { is: 4 }
  validates :name, length: { minimum: 3 }
  validates :code, :name, presence: true
  validates :code, uniqueness: true

  validate :defective

  def defective
    if self.defected == true
      puts "Product is defective"
    else
      puts "Product is not defective"
    end
  end

  before_validation :callback_before_validation

  def callback_before_validation
    puts "Callback called before validation"
  end

  after_validation :callback_after_validation

  def callback_after_validation
    puts "Callback called after validation"
  end

  before_save :callback_before_saving

  def callback_before_saving
    puts "Callback called before saving"
  end

  around_save :callback_around_saving

  def callback_around_saving
    puts "Callback inside around_save(before)"
    yield
    puts "Callback inside around save(after)"
  end

  after_rollback :callback_after_rollback

  def callback_after_rollback
    puts "Callback after rollback"
  end

  before_create :callback_before_create
  def callback_before_create
    puts "Callback before create"
  end

  after_create :callback_after_create

  def callback_after_create
    puts "Callback after create"
  end

  around_create :callback_around_create

  def callback_around_create
    puts "Callback around create(before)"
    puts "Callback around create(after)"
  end

  after_save :callback_after_save

  def callback_after_save
    puts "Callback after save"
  end

  before_update :callback_before_update
  def callback_before_update
    puts "Callback before update"
  end

  after_update :callback_after_update

  def callback_after_update
    puts "Callback after update"
  end

  around_update :callback_around_update

  def callback_around_update
    puts "Callback around update(before)"
    yield                                                                                                                                                         
    puts "Callback around update(after)"
  end

  before_destroy :callback_before_destroy
  def callback_before_destroy
    puts "Callback before destroy"
  end

  after_destroy :callback_after_destroy

  def callback_after_destroy
    puts "Callback after destroy"
  end

  around_destroy :callback_around_destroy

  def callback_around_destroy
    puts "Callback around destroy(before)"
    yield
    puts "Callback around destroy(after)"
  end

  after_commit :callback_after_commit

  def callback_after_commit
    puts "Callback after commit"
  end
end
