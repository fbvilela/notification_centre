class ReceivedUpdate < ActiveRecord::Base
  attr_accessible :agency_id, :name, :object_id, :time

  belongs_to :application

  validates_presence_of :agency_id, :name, :object_id
end
