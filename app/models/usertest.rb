class Usertest < ActiveRecord::Base

	mount_uploader :product, ProductUploader
	belongs_to :user
	
	validates :title, presence: true,
                    length: { minimum: 5 }

    scope :finished, where(['end_date < ?', DateTime.now])
    scope :published, where(['status = ?', true])

   has_many :uploads
   accepts_nested_attributes_for :uploads

end
