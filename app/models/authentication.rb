# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  attr_accessible :provider,
                  :uid,
                  :user_id,
                  :oauth_token,
                  :oauth_expires,
                  :oauth_secret,
                  :username

  belongs_to :user
end
