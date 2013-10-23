# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  text       :text
#  story_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sentence < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  has_many :votes

  attr_accessible :text
end
