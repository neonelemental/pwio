require 'rails_helper'

RSpec.describe Show, type: :model do
  it { should have_many :web_pages }
  it { should belong_to :promotion }
  it { should belong_to :venue }
end
