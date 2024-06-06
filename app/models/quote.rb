class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher
  has_many :quote_categories
  has_many :categories, through: :quote_categories

  accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true

  validates :text, :publication_year, :comment, :philosopher_id, presence: true
end
