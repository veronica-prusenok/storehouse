class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :count, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :check_quantity

  after_validation :change_count

  private

  def check_quantity
    errors.add(:count, "No such quantity of product in storehouse") if
      (unless direction == 'on'
        Product.find(product_id).count < count
      end)
  end

  def change_count
    product = Product.find(product_id)
    if direction == 'on'
      product.count = product.count + count
    else
      product.count = product.count - count
    end
    begin
      product.save
    rescue ActiveRecord::StaleObjectError
      change_count
    end
  end
end
