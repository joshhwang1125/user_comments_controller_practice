# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :username, :uniqueness => true

  has_many :contacts

  has_many :contact_shares

  has_many :shared_contacts,
  through: :contact_shares,
  source: :contact

  has_many :comments, as: commentable

end
