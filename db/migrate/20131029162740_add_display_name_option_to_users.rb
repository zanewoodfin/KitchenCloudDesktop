class AddDisplayNameOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selected_display_name, :integer, default: 0
  end
end
