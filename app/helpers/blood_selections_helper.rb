module BloodSelectionsHelper
  def get_status_theme(status)
    theme = case status
              when 2 then 'e'
              when 3 then 'd'
              when 4 then 'c'
              when 5 then 'f'
              else 'a'
    end
  end

  def pending_blood_selections(blood_selections)
    pending_blood_selections = []
    blood_selections.each do |blood_selection|
      pending_blood_selections << blood_selection if blood_selection.pending?
    end
    pending_blood_selections
  end

  def past_blood_selections(blood_selections)
    past_blood_selections = []
    blood_selections.each do |blood_selection|
      past_blood_selections << blood_selection unless blood_selection.pending?
    end
    past_blood_selections
  end
end
