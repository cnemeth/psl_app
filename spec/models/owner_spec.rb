# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  ssn        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Owner, type: :model do
  it { should have_many(:properties).inverse_of(:owner) }
  it { should have_many(:loans).inverse_of(:owner) }
  it { should validate_presence_of(:ssn) }
  it { should validate_uniqueness_of(:ssn) }
  it { should validate_length_of(:ssn).is_equal_to(9) }

  describe '#ssn' do
    describe 'with valid data' do
      it 'success' do
        expect{
          Owner.create!(ssn: '123456789')
        }.to change{Owner.count}.by(1)
      end
    end

    describe 'with invalid data' do
      it 'fails' do
        expect{
          Owner.create(ssn: 'abcdefghi')
        }.to_not change{Owner.count}
      end
    end
  end
end
