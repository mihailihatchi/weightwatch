require "will_paginate"
class Weight < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :weight
  public

  def self.find_for_user(user_id)
    return self.find :all,:conditions => "user_id=#{user_id}",:order=>'weighting_date'
  end
=begin rdoc
find the data for user and interval and sort by 
weight dat desc
=end
  def self.find_for_user_for_interval(user_id,start_date,end_date)
    format = ApplicationHelper::Entity.format
    start_date_format = start_date.strftime format
    end_date_format=end_date.strftime format    
    return self.find :all,:conditions => "user_id=#{user_id} and  weighting_date between '#{start_date_format}' and '#{end_date_format}'",
                        :order=>'weighting_date asc'
  end
=begin rdoc
find the data for the user for the given interval
and order them according to condition
=end
  def self.find_for_user_for_interval_with_order(user_id,start_date,end_date,order)
    format = ApplicationHelper::Entity.format
    start_date_format = start_date.strftime format
    end_date_format=end_date.strftime format
    return self.find :all,:conditions => "user_id=#{user_id} and  weighting_date between '#{start_date_format}' and '#{end_date_format}'",
                        :order=>order
  end

  def <=>(other)
    self.weight <=> other.weight
  end
end