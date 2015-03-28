desc "This task is called by the Heroku scheduler add-on"
task :update_trello => :environment do
  puts "Updating cards from Trello..."
  logger           = Logger.new(STDOUT)
  logger.level     = Logger::DEBUG
  Rails.logger     = logger
  Service::TrelloClient.new().reload_cards
  puts "done."
end

