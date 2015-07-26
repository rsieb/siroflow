require 'rails_helper'

RSpec.describe Card, type: :model do

  before(:all) do
    @tc = Service::TrelloClient.new()
    @tc.reload_cards
    @first = Card.first
  end

  before(:each) do
    @card = Card.new(name: 'My Test Card')
  end

  subject { @card }

  it "#name should be valid method" do
    expect(@card).to respond_to(:name)
  end

  it "#name returns correct string" do
    expect(@card.name).to match 'My Test Card'
  end

  it "should know about a client" do
    expect(@tc).to be_a_kind_of Service::TrelloClient
  end

  describe '.first' do

    it "should not be empty" do
      expect(@first).not_to be_nil
    end

    it "should return a card" do
      expect(@first).to be_a_kind_of Card
    end

  end

end
