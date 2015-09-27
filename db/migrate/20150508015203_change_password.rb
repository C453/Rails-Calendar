class ChangePassword < ActiveRecord::Migration
  def change
	add_column :users, :updated_password, :boolean, :default => false
  end
end
