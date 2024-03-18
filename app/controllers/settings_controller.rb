class SettingsController < ApplicationController
  before_action :authenticate_user! # redireciona para login se estiver deslogado
  def index
    # @products = Product.all
  end

  def update_user
    if current_user.update(user_params)
      redirect_to settings_path, notice: "user was successfully updated."
    else
      render :index # rederiza a view novamente "index" porque o objeto "current_user" vai estar atualiado com as mensagem de erro e o "simple_form_for" vao preencher com error
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone) # Permitindo parâmetros específicos do usuário
  end
end


