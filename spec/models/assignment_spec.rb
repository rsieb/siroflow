require 'rails_helper'

RSpec.describe Assignment, type: :model do

  before(:each) { @assignment = Assignment.new(name: 'My Test Assignment') }

  subject { @assignment }

  it { should respond_to(:name) }

  it "#name returns correct string" do
    expect(@assignment.name).to match 'My Test Assignment'
  end

end
