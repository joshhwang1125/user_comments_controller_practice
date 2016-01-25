# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :username, :uniqueness => true

  has_many :contact,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'Contact'
end
