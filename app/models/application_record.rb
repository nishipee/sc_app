class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sum_of_sales
    price * sold_num * 0.2
  end

  def sum_of_price
    product.price * quantity
  end

  def sum_of_sub_price
    if product.charge.id == 2
      0
    elsif product.charge.id == 3
      500 * quantity
    end
  end
end
