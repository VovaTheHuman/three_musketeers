class Relationship < ApplicationRecord
  # 1. Хто підписується (Фолловер)
  # Ми називаємо зв'язок :follower, але кажемо Rails: 
  # "Насправді дивись у таблицю Account (class_name)"
  belongs_to :follower, class_name: "Account"

  # 2. На кого підписуються (Зірка)
  # Те саме: назва :followed, але клас — Account
  belongs_to :followed, class_name: "Account"

  # 3. Валідації
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  # Вбудований метод унікальності: не можна підписатися двічі на ту саму людину
  validates :follower_id, uniqueness: { scope: :followed_id, 
                                        message: "ви вже підписані" }
end