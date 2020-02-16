require 'rails_helper'

RSpec.describe Scraping::Website, type: :model do
  it { should have_many :web_pages }
end
