require 'rails_helper'

RSpec.describe BloodSelection do
  let(:blood_selection_administered) { FactoryGirl.build(:blood_selection_administered)}

  it 'past? returns true if the blood_selection has bsel_StatusString Adminstered' do
    expect(blood_selection_administered.past?).to eq(true)
  end

  it 'pending? returns true if the blood_selection has bsel_StatusString != Adminstered' do
    expect(blood_selection_administered.pending?).to eq(false)
  end
end
