require 'digest/sha1'

class User < ActiveRecord::Base
 # has_many :weights
  validates_presence_of :username,:password
  validates_uniqueness_of   :username
  validates_length_of :username, :within => 1..20
  #Use this method to verify a user has the right to
  # use the application
    #START:login
    def self.authenticate(username, password)
      user = self.find_by_username(username)
      if user
        expected_password =user.password;
        if expected_password!=password
          user = nil
        end
      end
      user
    end
  def to_s
    return "Username"+username.to_s
  end
end
