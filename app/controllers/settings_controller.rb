class SettingsController < ApplicationController
  before_action :authenticate_user! # redireciona para login se estiver deslogado
  def index
    # @products = Product.all
  end

  def update_user
    if current_user.update(user_params)
      redirect_to settings_path, notice: 'user was successfully updated.'
      # redirect_to - ele de fato te redireciona, ai ele faz um 'referesh' na pagina toda
    else
      render :index # rederiza a view novamente "index" porque o objeto "current_user" vai estar atualiado com as mensagem de erro e o 'simple_form_for' vao preencher com error
      # 'render' nao da refreshing na pagina, leva os dados 'current_user'
    end 
  end

  def delete_img_user
    current_user.avatar.purge

    redirect_to settings_path, notice: 'Image deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :avatar) # Permitindo parâmetros específicos do usuário
  end
end


