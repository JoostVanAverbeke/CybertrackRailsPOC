require 'rails_helper'

RSpec.describe BloodSelection do
  let(:blood_selection_initial) { FactoryGirl.build(:blood_selection_initial)}

  it 'pending? returns true if the blood_selection has bsel_Status {Initial | Requested | Ward }' do
    expect(blood_selection_initial.pending?).to eq(true)
  end
end
