class Post < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true, :length => { :minimum => 3, :maximum => 60 }
	validates :blogpost, :presence => true, :length => { :minimum => 3, :maximum => 60 }
end
