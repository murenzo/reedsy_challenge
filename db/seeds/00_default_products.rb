progressbar = ProgressBar.create(
  title: 'Creating default products',
  total: 3
)

DEFAULT_PRODUCTS = [
  {
    code: 'MUG',
    name: 'Reedsy Mug',
    price: 6
  },
  {
    code: 'TSHIRT',
    name: 'Reedsy T-shirt',
    price: 15
  },
  {
    code: 'HOODIE',
    name: 'Reedsy Hoodie',
    price: 20
  }
]

DEFAULT_PRODUCTS.each do |product|
  Product.create(**product)
  progressbar.increment
end
