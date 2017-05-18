class RemoveColumnDefaults < ActiveRecord::Migration
  def change
    change_column_default(:users, :authorization_token, nil)
    change_column_default(:users, :phone_number, nil)
  end
end
