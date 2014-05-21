class AssociationTest < ActiveRecord::Base
	has_many :association_attachments
	accepts_nested_attributes_for :association_attachments
end