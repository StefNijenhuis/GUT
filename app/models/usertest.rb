class Usertest < ActiveRecord::Base

	belongs_to :user
	has_many :testmethods
	
	validates :title, presence: true,
                    length: { minimum: 5 }

end
