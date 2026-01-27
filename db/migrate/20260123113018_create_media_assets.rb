class CreateMediaAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :media_assets do |t|
      t.references :post, null: false, foreign_key: true
      t.string :asset_type, null: false
      t.integer :position, default: 0, null: false

      t.timestamps
    end

    add_index :media_assets, [:post_id, :position]
  end
end
