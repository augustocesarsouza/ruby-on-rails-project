class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  #ApplicationController, que é a classe pai de todos os controladores na sua aplicação Rails:
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :phone])
  end

  #Isso é usado para garantir que apenas parâmetros específicos sejam aceitos para evitar ataques de mass assignment.
  #Os parâmetros permitidos definidos neste método incluem :name, :email, :password, :password_confirmation e :phone,  
  #o que significa que esses campos podem ser enviados no formulário de inscrição do Devise.

  private
  
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:notice] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_back(fallback_location: admin_root_path)
  end
end
