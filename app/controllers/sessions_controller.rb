class SessionsController < ApplicationController
  def new
    # Просто показує сторінку з формою логіну
  end

  def create
  account = Account.find_by(email: params[:email])
  
  # authenticate — це метод, який дає гем bcrypt
  if account && account.authenticate(params[:password])
    session[:account_id] = account.id
    redirect_to root_path, notice: "З поверненням!"
  else
    # Якщо пароль невірний, повертаємо на форму
    flash.now[:alert] = "Невірний email або пароль"
    render :new, status: :unprocessable_entity
  end
end

  def destroy
    # Очищуємо сесію, щоб "вийти"
    session[:account_id] = nil
    redirect_to root_path, notice: "Ви вийшли з акаунта."
  end
end