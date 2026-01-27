class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:account_id] = @account.id
      redirect_to root_path, notice: "Акаунт створено!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation)
  end
end