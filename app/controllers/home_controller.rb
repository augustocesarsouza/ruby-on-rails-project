class HomeController < ApplicationController
  def index
    @products = Product.select(:id, :name, :price, :promo, :promo_price)
    # não precisa do "with_attached_image" só precisa do ":id" para ele conseguir
    #puchar no banco de dados do "active_storage"

    # @products = Product.all
  end
end


