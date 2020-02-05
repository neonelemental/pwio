require 'rails_helper'

RSpec.describe WebPage, type: :model do
  it { should belong_to :web_pageable }
  it { should belong_to :website }
  it { should have_many :page_visits }
end
