class CalorieIntake < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :calorie_intake
  def self.find_for_user(user_id)
    return self.find :all,:conditions => "user_id=#{user_id}"
  end

  def self.find_for_user_for_interval(user_id,start_date,end_date)
    format = ApplicationHelper::Entity.format
    start_date_format = start_date.strftime format
    end_date_format=end_date.strftime format
    return self.find :all,:conditions => "user_id=#{user_id} and  date between '#{start_date_format}' and '#{end_date_format}'",:order=>'date'
  end

end
