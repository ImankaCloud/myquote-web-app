class Category < ApplicationRecord
    has_many :quote_categories
    has_many :quotes, through: :quote_categories
  end
  