class Picture < ActiveRecord::Base

  belongs_to :User

  has_attached_file :picture, :styles => {medium: "300x300>", :thumb => "100x100>"}

  validates_attachment :picture, :presence => true,
    :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
    :size => { :in => 0..10.megabytes }
end