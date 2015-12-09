FactoryGirl.define do
  factory :blood_selection do
    sequence :bsel_Id do |n|
      n
    end

    factory :blood_selection_initial do
      bsel_Status 1
      bsel_StatusString 'Initial'
    end

    factory :blood_selection_checked do
      bsel_Status 3
      bsel_StatusString 'Checked'
    end

    factory :blood_selection_ready do
      bsel_Status 4
      bsel_StatusString 'Ready'
    end

    factory :blood_selection_adminstered do
      bsel_Status 6
      bsel_StatusString 'Administered'
    end
  end
end
