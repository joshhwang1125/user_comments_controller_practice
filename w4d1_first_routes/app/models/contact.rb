# require 'pry'
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
  validates :name, :email, :user_id, :presence => true
  validates :email, :uniqueness => {:scope => :user_id}
  validate :user_id_must_exist



  def user_id_must_exist
    begin
      User.find(self.user_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:user_id, "does not exist")
    end
  end

  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'User'

  has_many :contact_share,
  foreign_key: :contact_id,
  primary_key: :id,
  class_name: 'ContactShare'

  has_many :shared_users,
  through: :contact_share,
  source: :user
end
