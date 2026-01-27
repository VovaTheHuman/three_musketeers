class Reaction < ApplicationRecord
  # Тільки ці два зв'язки!
  belongs_to :account
  belongs_to :post

  # Валідація: один мушкетер може лайкнути один пост лише один раз
  validates :account_id, uniqueness: { scope: :post_id, message: "ви вже лайкнули цей допис" }
end