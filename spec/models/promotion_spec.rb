require 'rails_helper'

RSpec.describe Promotion, type: :model do
  it { should have_many :shows }
end
