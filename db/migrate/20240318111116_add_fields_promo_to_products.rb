class AddFieldsPromoToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :promo, :boolean, default: false
    add_column :products, :promo_price, :decimal, default: 0.0
  end
end
