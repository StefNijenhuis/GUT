class Upload < ActiveRecord::Base

   mount_uploader :photo, PhotoUploader
   belongs_to :usertest
end
