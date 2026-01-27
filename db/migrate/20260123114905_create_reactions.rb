class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true # Оцей рядок створює post_id

      t.timestamps
    end
  end
end