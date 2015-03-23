require 'rails_helper'

RSpec.describe Card, type: :model do

  before(:each) { @card = Card.new(name: 'My Test Card') }

  subject { @card }

  it "#name should be valid method" do
    expect(@card).to respond_to(:name)
  end

  it "#name returns correct string" do
    expect(@card.name).to match 'My Test Card'
  end

end
