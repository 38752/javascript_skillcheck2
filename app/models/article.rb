class Article < ApplicationRecord
  validates :text, presence: true
  validates :status, presence: true
end
