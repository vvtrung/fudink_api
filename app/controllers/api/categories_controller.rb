class Api::CategoriesController < ApplicationController
  def index
    categories = parse_json Category.all
    json_response categories
  end
end
