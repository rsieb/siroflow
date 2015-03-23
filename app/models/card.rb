class Card < Assignment

  # on initializing class, reload cards from Trello
  tc = Service::TrelloClient.new()
  tc.reload_cards

  def self.model_name
    Assignment.model_name
  end

end
