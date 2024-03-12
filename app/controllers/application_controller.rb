class ApplicationController < ActionController::Base
  #ApplicationController, que é a classe pai de todos os controladores na sua aplicação Rails:
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :phone])
  end

  #Isso é usado para garantir que apenas parâmetros específicos sejam aceitos para evitar ataques de mass assignment.
  #Os parâmetros permitidos definidos neste método incluem :name, :email, :password, :password_confirmation e :phone,  
  #o que significa que esses campos podem ser enviados no formulário de inscrição do Devise.
end
