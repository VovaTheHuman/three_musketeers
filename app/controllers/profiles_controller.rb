class ProfilesController < ApplicationController
  def show
    # Знаходимо профіль за username з посилання (наприклад, user_2)
    @profile = Profile.find_by!(username: params[:id])
    
    # Дістаємо всі пости саме цього акаунта
    @posts = @profile.account.posts.order(created_at: :desc)
  end
end