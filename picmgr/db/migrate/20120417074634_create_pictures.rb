class CreatePictures < ActiveRecord::Migration
  def up
    create_table :pictures do |t|
      t.has_attached_file :picture
      t.timestamps
    end
  end

  def down
    drop_table :pictures
  end
end
