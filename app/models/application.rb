class Application < ActiveRecord::Base
  attr_accessible :name, :url

  validates_presence_of :name, :url

  has_many :received_updates, :dependent => :destroy
end
