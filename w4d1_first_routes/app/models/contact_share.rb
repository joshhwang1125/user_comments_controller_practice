# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, :presence => true
  validates :contact_id, :uniqueness => {:scope => :user_id}

  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'User'

  belongs_to :contact,
  foreign_key: :contact_id,
  primary_key: :id,
  class_name: 'Contact'
end
