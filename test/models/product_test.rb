require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "product price must be positive" do
# цена товара должна быть положительной
product = Product.new(title: "My Book Title",
description: "yyy",
image_url: "zzz.jpg")
product.price = -1
assert product.invalid?
assert_equal ["must be greater than or equal to 0.01"],
product.errors[:price]
# должна быть больше или равна 0.01
product.price = 0
assert product.invalid?
assert_equal ["must be greater than or equal to 0.01"],
product.errors[:price]
product.price = 1
assert product.valid?
end
def new_product(image_url)
Product.new( title: "My Book Title",
description: "yyy",
price: 1,
image_url: image_url)
end
test "image url" do
# url изображения
ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
http://a.b.c/x/y/z/fred.gif }
bad = %w{ fred.doc fred.gif/more fred.gif.more }
ok.each do |name|
assert new_product(name).valid?, "#{name} shouldn't be invalid"
# не должно быть неприемлемым
end
bad.each do |name|
assert new_product(name).invalid?, "#{name} shouldn't be valid"
# не должно быть приемлемым
end
end

end
