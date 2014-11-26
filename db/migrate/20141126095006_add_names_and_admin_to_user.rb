class AddNamesAndAdminToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.boolean :admin
    end
  end
end
