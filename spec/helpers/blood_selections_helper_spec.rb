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
RSpec.describe SessionsHelper, type: :helper do

  let(:blood_selection_initial_1) { FactoryGirl.build(:blood_selection_initial)}
  let(:blood_selection_initial_2) { FactoryGirl.build(:blood_selection_initial)}
  let(:blood_selection_ready_1) { FactoryGirl.build(:blood_selection_ready)}
  let(:blood_selection_checked_1) { FactoryGirl.build(:blood_selection_checked)}
  let(:blood_selection_checked_2) { FactoryGirl.build(:blood_selection_checked)}

  let(:blood_selections) {
    [
        blood_selection_initial_1,
        blood_selection_checked_1,
        blood_selection_ready_1,
        blood_selection_checked_2,
        blood_selection_initial_2,
    ]}

  it 'returns the empty array of pending blood_selections when an empty blood_selections array is passed' do
    expect(helper.pending_blood_selections([]).length).to eq(0)
  end

  it 'returns the pending transfusions (blood_selections)' do
    expect(helper.pending_blood_selections(blood_selections).length).to eq(4)
  end

  it 'returns the past transfusions (blood_selections)' do
    expect(helper.past_blood_selections(blood_selections).length).to eq(1)
    end
end