class ReceivedUpdate < ActiveRecord::Base
  attr_accessible :agency_id, :name, :obj_id, :time

  belongs_to :application

  validates_presence_of :agency_id, :name, :obj_id
  
  def self.since(since = 1.month.ago )
    since ||= 1.month.ago 
    where("time >= ?", since )    
  end
  
end
