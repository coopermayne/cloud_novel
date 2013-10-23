# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  sentence_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  vote        :boolean
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :sentence
  attr_accessible :vote
end
