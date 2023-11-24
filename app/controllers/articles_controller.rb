class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # show will by default render app/views/articles/show.html.erb
  def show
    @article = Article.find(params[:id])
  end

  # instantiates a new article, but does not save it.
  # Will be used in the view whenbuilding the form.
  # by default renders app/views/articles/new.html.erb
  def new
    @article = Article.new
  end

  # instantiates a new article and attempts to save it.
  # If the save is successful, the action redirects the browser to the article's page.
  # Else the action redisplays the form with an error message.
  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
end
