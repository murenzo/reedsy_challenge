progressbar = ProgressBar.create(
  title: 'Creating default products',
  total: 3
)

DEFAULT_PRODUCTS = [
  {
    code: 'MUG',
    name: 'Reedsy Mug',
    price: 6.00
  },
  {
    code: 'TSHIRT',
    name: 'Reedsy T-shirt',
    price: 15.00
  },
  {
    code: 'HOODIE',
    name: 'Reedsy Hoodie',
    price: 20.00
  }
]

DEFAULT_PRODUCTS.each do |product|
  Product.create(**product)
  progressbar.increment
end
