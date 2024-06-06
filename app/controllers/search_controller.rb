class SearchController < ApplicationController
  def index
    keyword_query = params[:keyword_query] # Retrieves the keyword
    if keyword_query.present?
      # Searches for quotes matching the keyword query in philosopher's first name, last name, or quote text
      @quotes = Quote.joins(:philosopher).where("philosophers.first_name LIKE ? OR philosophers.last_name LIKE ? OR quotes.text LIKE ?", "%#{keyword_query}%", "%#{keyword_query}%", "%#{keyword_query}%").distinct
    else
      @quotes = Quote.none # Sets @quotes to an empty collection if no keyword query is provided
    end
  end
end
