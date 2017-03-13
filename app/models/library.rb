class Library < ApplicationRecord
  has_many :library_users, dependent: :destroy
  has_many :users, through: :library_users

  def member? user
    user.libraries.include?(self)
  end

end
