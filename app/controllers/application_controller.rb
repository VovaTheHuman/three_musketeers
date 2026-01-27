class ApplicationController < ActionController::Base
  # helper_method дозволяє Владу і Вові використовувати цей метод у в'юшках
  helper_method :current_account

  private

  def current_account
    # Знаходимо акаунт за ID з сесії, якщо він там є
    # @current_account ||= — вбудований прийом, щоб не питати базу двічі (memoization)
    @current_account ||= Account.find_by(id: session[:account_id]) if session[:account_id]
  end
end