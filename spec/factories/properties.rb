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

FactoryGirl.define do
  factory :property do
    value Faker::Number.number(10)
    owner
  end
end
