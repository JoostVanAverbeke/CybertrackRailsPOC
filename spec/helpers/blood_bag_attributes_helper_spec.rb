require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BloodBagAttributesHelper. For example:
#
# describe BloodBagAttributesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BloodBagAttributesHelper, type: :helper do
  it 'returns the href format \"#<label>i\" for the specified label' do
    expect(helper.anchor_href('label')).to eq('"#label"')
  end
end
