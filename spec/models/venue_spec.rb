require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should have_many :shows }
end
