class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :account, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
