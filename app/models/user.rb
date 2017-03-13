class User < ApplicationRecord
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  has_many :library_users, dependent: :destroy
  has_many :libraries, through: :library_users

end
