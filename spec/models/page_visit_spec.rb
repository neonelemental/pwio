require 'rails_helper'

RSpec.describe PageVisit, type: :model do
  it { should belong_to :web_page }
end
