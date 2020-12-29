class AddUserIdReferenceToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :user_id, :integer
    add_foreign_key :entries, :users
  end
end
