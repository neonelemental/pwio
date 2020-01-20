module Profightdb
  module Constants
    ROOT_URL =
        "http://www.profightdb.com".freeze
    SHOWS_BASE_URL =
        "http://www.profightdb.com/cards/pg1-no.html".freeze
    HTML_CACHE_DIR =
        Rails.root.join("lib", "assets", "html", "profightdb").freeze
  end
end