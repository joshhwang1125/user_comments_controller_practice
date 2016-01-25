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
  validates :contact_id, :user_id :presence => true
  validates :contact_id, :uniqueness => {:scope => :user_id}


end
