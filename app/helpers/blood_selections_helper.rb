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
end
