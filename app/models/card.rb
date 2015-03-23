class Card < Assignment

  # on initializing class, reload cards from Trello
  tc = Service::TrelloClient.new()
  tc.reload_cards


end
