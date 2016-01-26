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

  has_many :contacts
  # foreign_key: :user_id,
  # primary_key: :id,
  # class_name: 'Contact'

  has_many :contact_share,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'ContactShare'

  has_many :shared_contacts,
  through: :contact_share,
  source: :contact

end
