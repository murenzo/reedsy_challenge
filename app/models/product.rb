class Product < ApplicationRecord
  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 10}
  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**2) },
                    format: { with: /\A\d{1,2}(\.\d{1,2})?\z/ }
end
