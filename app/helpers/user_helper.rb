module UserHelper
  def user_avatar_url(current_user)
    return current_user.avatar if current_user.avatar.attached?

    'user-profile2'
  end

  def change_data_controller(current_user)
    return 'remover-avatar-user' if current_user.avatar.attached?

    'change-avatar-user'
  end
end