# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  contact_id       :integer
#  contact_share_id :integer
#  commentee_id     :integer
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  validates :user_id, :presence => true

  belongs_to :commentable, polymorphic: true

end
