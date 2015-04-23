class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def expired_time
    time = DateTime.now.to_time - updated_at.to_time
    time /= 60**2
    destroy! if time >= 24
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
end
