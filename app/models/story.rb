# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Story < ActiveRecord::Base
  #each row represents a line in the story
  #the last row is the one being voted on...
  has_many :sentences
end
