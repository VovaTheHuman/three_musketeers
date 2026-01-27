class Account < ApplicationRecord
  # Вбудований метод для роботи з паролями (потрібен гем bcrypt)
  has_secure_password 

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  
  # Валідації тепер живуть тут, бо таблиця Profile видалена
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end