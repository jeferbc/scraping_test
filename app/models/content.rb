# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  tag        :string
#  content    :string
#  webpage_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Content < ApplicationRecord
  belongs_to :webpage

  validates_presence_of :tag, :content
end
