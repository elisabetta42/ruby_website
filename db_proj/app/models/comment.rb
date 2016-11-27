class Comment < ActiveRecord::Base
	validates :comment_text, presence: true
    validates :refers_to , presence: true
	validates :comment_user , presence: true
	
end
