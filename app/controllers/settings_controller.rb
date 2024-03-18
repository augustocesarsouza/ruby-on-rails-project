class SettingsController < ApplicationController
  before_action :authenticate_user! # redireciona para login se estiver deslogado
  def index
    # @products = Product.all
  end

  def update
    # fazer, tem que fazer foto
  end
end


