class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  scope :likes_count, -> { 
	  select('ideas.*, COUNT(likes.idea_id) AS likes_count')
	  .joins(:likes)
	  .group('ideas.id')
	  .order('likes_count DESC')
	}
end
