class Picture < ActiveRecord::Base

  belongs_to :User

  has_attached_file :picture, :styles => {medium: "300x300>", :thumb => "100x100>"}, 
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :bucket => proc {|attachment| "picmgr_#{Rails.env.to_s}"},
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :picture, :presence => true,
    :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
    :size => { :in => 0..10.megabytes }
end