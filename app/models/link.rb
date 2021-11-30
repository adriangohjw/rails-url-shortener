class Link < ApplicationRecord
  validates :original_url, url: true
  validates :shortened_path, presence: true, uniqueness: true
end
