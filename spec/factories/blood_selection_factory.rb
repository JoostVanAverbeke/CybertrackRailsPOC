FactoryGirl.define do
  factory :blood_selection do
    sequence :bsel_Id do |n|
      n
    end
    bsel_Status 1


    factory :blood_selection_requested do
      bsel_StatusString 'Requested'
    end

    factory :blood_selection_lab do
      bsel_StatusString 'Lab'
    end

    factory :blood_selection_ward do
      bsel_StatusString 'Ward'
    end

    factory :blood_selection_busy do
      bsel_StatusString 'Busy'
    end

    factory :blood_selection_administered do
      bsel_StatusString 'Administered'
    end
  end
end
