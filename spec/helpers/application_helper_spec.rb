require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PatientsHelper. For example:
#
# describe PatientsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do

  it 'json_to_datetime converts a valid json datetime string to a ruby datetime' do
    expect(helper.json_to_datetime('2015-07-09T14:00:00.000')).to eq(DateTime.new(2015, 7, 9, 14))
  end

  it 'json_to_datetime converts a empty string to a nil object' do
    expect(helper.json_to_datetime('')).to be_nil
  end

  it 'json_to_datetime converts a nil object to a nil object' do
    expect(helper.json_to_datetime(nil)).to be_nil
  end
end