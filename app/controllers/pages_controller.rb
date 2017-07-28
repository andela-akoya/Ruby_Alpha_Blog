class PagesController < ApplicationController
  def home
    @article = Article.first
    @new_article = Article.new
  end

  def about; end
end
