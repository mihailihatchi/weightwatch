class Training < ActiveRecord::Base
  public
    TRAINING_TYPES = [
    #  Displayed        stored in db
    [ "Cardiovascular",          "cardio" ],
    [ "Strength",    "strength"   ]

  ]
  belongs_to :user
  has_one :user
  validates_presence_of :duration,:calories,:training_type
  validates_numericality_of :duration,:calories,:only_integer=>true
  def self.find_for_user(user_id)
    return self.find :all,:conditions=>"user_id=#{user_id}"
  end
  def self.find_for_user_for_interval(user_id,start_date,end_date)
    format = ApplicationHelper::Entity.format
    start_date_format = start_date.strftime format
    end_date_format=end_date.strftime format
    return self.find :all,:conditions => "user_id=#{user_id} and  training_date between '#{start_date_format}' and '#{end_date_format}'",:order=>'training_date'

  end

  
end