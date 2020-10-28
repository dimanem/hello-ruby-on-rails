class ArticlesController < ApplicationController
  # "> rails routes" command maps command to routes
  # Left side is command name, right side the action: Controller#Action
  # Example: articles GET /articles(.:format) articles#index

  # Auth
  # http_basic_authenticate_with name: "user", password: "pass", except: [:index, :show]

  # Listing all articles
  # GET /articles(.:format)
  def index
    @articles = Article.all
  end

  # GET /articles/new
  def new
    # shows "views/articles/new.html.erb" (name has to be "new" same as method)
    # we set @article for usage inside html
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
