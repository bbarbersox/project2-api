#
class User < ActiveRecord::Base
  include Authentication

  has_many :properties
  has_many :activities
end
