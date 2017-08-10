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

require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should belong_to(:webpage) }
  it { should validate_presence_of(:tag) }
  it { should validate_presence_of(:content) }
end
