class RemoveUsers < ActiveRecord::Migration
  def change
    drop_table :users, force: :cascade
  end
end
