require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attibutes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:price].any?
    # put product.errors
  end
  
  test "price must be positive" do
    product = Product.new(title: "my title",
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.price = -1
    assert product.valid?, product.errors[:price].join(';')
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join(';')
  
  product.price = 1
  assert product.valid?
 # assert_equal "must be greater than or equal to 0.01", 
        product.errors[:price].join(';')
      
      
  end
end
