require 'rails_helper'

RSpec.describe Scraping::PageVisit, type: :model do
  it { should belong_to :web_page }
end
