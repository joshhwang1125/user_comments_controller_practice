# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id :presence => true
  validates :email, :uniqueness => {:scope => :user_id}

  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'User'

end
