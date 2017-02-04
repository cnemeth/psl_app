# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  ssn        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :owner do
    ssn "#{Faker::Number.number(9)}"

    factory :owner_with_properties do
      transient do
        properties_count 3
      end

      after(:create) do |owner, evaluator|
        create_list(:property, evaluator.properties_count, owner: owner)
      end
    end

    factory :owner_with_loans do
      transient do
        loans_count 3
      end

      after(:create) do |owner, evaluator|
        create_list(:loan, evaluator.loans_count, owner: owner)
      end
    end
  end
end
