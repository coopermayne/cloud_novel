# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  password_hash :string(255)
#  password_salt :string(255)
#

class User < ActiveRecord::Base

  has_many :authentications
  has_many :votes
  has_many :sentences
  has_many :authentications
  attr_accessible :email, :password, :password_confirmation, :name

  attr_accessor :password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def logged_in? provider
    self.authentications.select{|auths| auths.provider=="twitter"}.count > 0
  end

end

