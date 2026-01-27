class Comment < ApplicationRecord
  # Вбудовані зв'язки: коментар належить автору та посту
  belongs_to :account
  belongs_to :post
  has_many :comment_reactions, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500 }
end