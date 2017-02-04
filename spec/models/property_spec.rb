# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  value_cents :integer
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:owner).inverse_of(:properties) }
  it { should have_one(:loan).inverse_of(:property) }

  it { is_expected.to monetize(:value).with_currency(:usd) }
  it { should validate_numericality_of(:value) }
  it { should allow_value(0).for(:value) }
  it { should allow_value(9999999999).for(:value) }
  it { should_not allow_value(-99).for(:value) }
end
