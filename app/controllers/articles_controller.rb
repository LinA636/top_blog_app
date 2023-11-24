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
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # fetches the article form the database and destroys it.
  # redirects the browser to the root path with 303-message
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
