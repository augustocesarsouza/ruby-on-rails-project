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

  def update_password # existe outro jeito de atualizar a senha parece que essa mais simples
    # esse metodo sabe muita coisa, atualizar renderizar 'bypass_sign_in', tem que quebrar esse metodo, ou até esse controller 
    if !current_password_params[:current_password].empty? && current_user.valid_password?(current_password_params[:current_password])
      if current_user.update(password_params)
        bypass_sign_in(current_user) # isso é para ele nao deslogar automaticamente, quando atualizar a senha
        redirect_to password_settings_path, notice: 'Senha atualizada com sucesso'
      else
        flash.now[:alert] = "Erro ao atualizar a senha."
        render :password
      end
    else
      flash[:error] = 'Senha atual incorreta'
      redirect_to password_settings_path
    end
  end

  def password
    
  end

  def delete_img_user
    current_user.avatar.purge

    redirect_to settings_path, notice: 'Image deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :avatar) # Permitindo parâmetros específicos do usuário
  end

  def current_password_params
    params.require(:user).permit(:current_password)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end


