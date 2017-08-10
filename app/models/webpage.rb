# == Schema Information
#
# Table name: webpages
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Webpage < ApplicationRecord
  has_many :contents

  validates_presence_of :url
end
