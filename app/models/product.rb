class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, uniqueness: true, presence: true

  has_attached_file :image, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
