class Tags < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :label, :user_id
	belongs_to :user
end
