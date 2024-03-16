class HomeController < ApplicationController
  def index
    @products = Product.select(:id, :name, :price).with_attached_image # precisa do id para fazer "attached" da imagem
    # @products = Product.all
  end
end


