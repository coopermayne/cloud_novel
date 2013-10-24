# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  sentence_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vote        :boolean
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :sentence
  attr_accessible :vote

  #validates_presence_of :user_id, :vote, :sentence_id
  # don't allow for save user to vote twice on same sentence

end
