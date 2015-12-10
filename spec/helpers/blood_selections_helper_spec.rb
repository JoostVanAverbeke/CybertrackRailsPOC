require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BloodSelectionsHelper, type: :helper do

  let(:blood_selection_requested_1) { FactoryGirl.build(:blood_selection_requested)}
  let(:blood_selection_requested_2) { FactoryGirl.build(:blood_selection_requested)}
  let(:blood_selection_ward_1) { FactoryGirl.build(:blood_selection_ward)}
  let(:blood_selection_administered_1) { FactoryGirl.build(:blood_selection_administered)}
  let(:blood_selection_administered_2) { FactoryGirl.build(:blood_selection_administered)}

  let(:blood_selections) {
    [
        blood_selection_requested_1,
        blood_selection_administered_1,
        blood_selection_ward_1,
        blood_selection_administered_2,
        blood_selection_requested_2,
    ]}

  it 'returns the empty array of pending blood_selections when an empty blood_selections array is passed' do
    expect(helper.pending_blood_selections([]).length).to eq(0)
  end

  it 'returns the pending transfusions (blood_selections)' do
    expect(helper.pending_blood_selections(blood_selections).length).to eq(3)
  end

  it 'returns the past transfusions (blood_selections)' do
    expect(helper.past_blood_selections(blood_selections).length).to eq(2)
    end
end