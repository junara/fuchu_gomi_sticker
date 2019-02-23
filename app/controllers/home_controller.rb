# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @trashes = Trash.algolia_search(params[:query], hitsPerPage: 10, page: params[:page])
  end
end
