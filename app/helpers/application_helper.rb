require 'date'
module ApplicationHelper
  def json_to_datetime(json_datetime_string)
    DateTime.parse(json_datetime_string) unless json_datetime_string.blank?
  end
end

