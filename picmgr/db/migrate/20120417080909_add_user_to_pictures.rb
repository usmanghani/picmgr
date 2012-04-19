class AddUserToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.references :users
    end
  end
end
