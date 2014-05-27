class Usertest < ActiveRecord::Base

	belongs_to :user
	has_many :testmethods
	
	validates :title, presence: true,
                    length: { minimum: 5 }

    #scope :finished, :conditions => { :end_date < ?, Time.now.to_datetime }

    scope :finished, where(['end_date < ?', DateTime.now])
    scope :published, where(['status = ?', true])

end
