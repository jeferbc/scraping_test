# == Schema Information
#
# Table name: webpages
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Webpage, type: :model do
  it { should have_many(:contents) }
  it { should validate_presence_of(:url) }
end
