class CleanupOldTables < ActiveRecord::Migration[7.2]
  def change
    # Видаляємо таблиці, які залишилися від старого проекту
    drop_table :users if table_exists?(:users)
    drop_table :posts if table_exists?(:posts)
    
    # Також видалимо таблиці ActiveStorage, якщо ти не плануєш 
    # використовувати їх прямо зараз у тому ж вигляді
    drop_table :active_storage_variant_records if table_exists?(:active_storage_variant_records)
    drop_table :active_storage_attachments if table_exists?(:active_storage_attachments)
    drop_table :active_storage_blobs if table_exists?(:active_storage_blobs)
  end
end