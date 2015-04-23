class AddExpiredToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :expired, :boolean
  end
end
