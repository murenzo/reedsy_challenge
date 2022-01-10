class Product < ApplicationRecord
  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 10}
  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  validates :price, numericality: { only_integer: true }
end
