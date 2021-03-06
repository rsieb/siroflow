require 'trello'

#module Service
  class TrelloClient

    # setting up a singleton for this connection
    @@client = self
    Trello.configure do |config|
      config.developer_public_key = '4e6c43e46dd7bbe3292353e7e9baa9d3' # The "key" from step 1
      config.member_token = 'b06db04096f423c405a3262ded4ff720ad0af141a3edc13843ff77b9b6881444' # The token from step 3.
    end

    def initialize()
      Rails.logger.info "Initializing Trello connection..."
      @@client = Trello::Member.find("cyberroland")
    end

    def boards()
      @boards = @@client.boards.find_all
    end

    def board_name(board_id)
      Trello::Board.find(board_id).name
    end

    def list_name(list_id)
      Trello::List.find(list_id).name
    end

    def cards
      @@cards = []
      self.boards.each do |b|
        firstchar = b.name[0]
        if (firstchar =~ /[[:digit:]]/ && firstchar.to_i < 6) ## this means it's below the Buffett barrier and thus top priority
          b.cards.each do |c|
            @@cards << c
          end
        end
      end
      return @@cards
    end

    def reload_cards(force=false)
      tijd= Time.now()
      last_updated = Card.maximum(:updated_at) || Time.at(0)
      Rails.logger.debug("Last updated is #{last_updated}")
      Rails.logger.debug("Starting reload_cards " + (Time.now - tijd).to_s)
      counter = 0
      self.cards.each do |tc|
        counter = counter + 1
        if (tc.last_activity_date > last_updated || force==true)
          c = Card.find_or_initialize_by(id_native: tc.id)
          c.id_native        = tc.id
          c.name             = tc.name
          c.url              = tc.short_url
          c.planned_start    = tc.due
          c.closed           = tc.closed
          c.prio_native      = tc.pos
          c.parent_id_native = tc.board_id
          c.context          = board_name(tc.board_id)
          Rails.logger.debug("#{c.context} #{c.name}")
          c.status           = list_name(tc.list_id)
          c.updated_at_native = tc.last_activity_date
          Rails.logger.info("Updated #{counter} " + (Time.now - tijd).to_s)
          c.save!
          Rails.logger.warn("Saved #{counter} " +  (Time.now - tijd).to_s)
        end
      end
      Rails.logger.warn("Done with reload_cards " + (Time.now - tijd).to_s)
    end
  end
#end
