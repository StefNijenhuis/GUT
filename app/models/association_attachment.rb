class AssociationAttachment < ActiveRecord::Base
	mount_uploader :image, AssociationUploader
	belongs_to :association_test
end