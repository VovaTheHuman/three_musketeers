class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      # Додаємо default: 'active', щоб не прописувати статус вручну при реєстрації
      # Додаємо null: false, щоб статус ніколи не був порожнім
      t.string :status, default: 'active', null: false

      t.timestamps
    end

    # Додаємо індекс. Він допоможе базі миттєво знаходити, наприклад, 
    # усіх заблокованих користувачів або тільки активних.
    add_index :accounts, :status
  end
end