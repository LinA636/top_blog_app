class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # show will by default render app/views/articles/show.html.erb
  def show
    @article = Article.find(params[:id])
  end
end
