class CreateRelationships < ActiveRecord::Migration[7.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    # Індекси для швидкості пошуку
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # Унікальний індекс, щоб не можна було підписатися двічі на ту саму людину
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
