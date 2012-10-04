
namespace :received_updates do 
  
  desc "Delete updates older than 30 days."
  task :clear => :environment do 
    ReceivedUpdate.where("time < ?", 1.month.ago).collect(&:destroy)
  end
  
end