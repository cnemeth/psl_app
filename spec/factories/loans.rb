# == Schema Information
#
# Table name: loans
#
#  id           :integer          not null, primary key
#  amount_cents :integer
#  status       :string(255)
#  ltv          :decimal(5, 2)
#  owner_id     :integer
#  property_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :loan do
    amount Faker::Number.number(10)
    status ''
    ltv Faker::Number.decimal(5,2)
    owner
    property
  end
end
