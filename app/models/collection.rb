class Collection < ApplicationRecord
  has_many :torrents, as: :torrentable
end
