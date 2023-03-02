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

  # around_save :callback_around_saving

  # def callback_around_saving
  #   puts "Callback inside around_save"
  # end
end
