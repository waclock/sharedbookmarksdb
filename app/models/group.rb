class Group < ActiveRecord::Base
	has_many :folders, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :user_groups, dependent: :destroy
	has_many :users, through: :user_groups
	belongs_to :user
	after_create :default_user_group

	def default_user_group
		#self.user_groups.where(user_id: self.user_id).first_or_create
	end
end
