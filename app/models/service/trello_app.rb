require 'trello'

module Service
  class TrelloApp

    # setting up a singleton for this connection
    @@client = self
    Trello.configure do |config|
      config.developer_public_key = '4e6c43e46dd7bbe3292353e7e9baa9d3' # The "key" from step 1
      config.member_token = 'b06db04096f423c405a3262ded4ff720ad0af141a3edc13843ff77b9b6881444' # The token from step 3.
    end


    def initialize()
      Rails.logger.info "Initializing Trello connection..."
      @@client
    end

    def self.boards()
      @boards = Trello::Board.all
    end

  end
end
