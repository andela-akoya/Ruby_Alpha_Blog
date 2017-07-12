class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
		article_hash = article_params
		if article_hash
    	@article = Article.new(article_hash)
			save_article
		else
			flash[:notice] = 'Sorry, An error occurred! Please try again'
			flash[:color] = 'red'
			redirect_back fallback_location: @post
		end
  end

  def update
		image_id = @article.image_remote_id
    if @article.update(article_params)
			flash[:notice] = 'Article was successfully updated'
			flash[:color] = 'green'
			update_uploaded_image image_id
			redirect_to article_path(@article)
		else
			render 'edit'
    end
  end

  def edit; end

  def show; end

  def destroy
		image_id = @article.image_remote_id
    if @article.destroy
			flash[:notice] = 'Article was successfully deleted'
			flash[:color] = 'red'
			delete_uploaded_image image_id
		else
			flash[:notice] = 'Sorry, An error occurred! Article could not be deleted'
			flash[:color] = 'red'
		end
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    parameters = params.require(:article).permit(:title, :description, :image)
		image_hash = upload_image(parameters[:image])
		if !image_hash.empty?
			parameters[:image_remote_url] = image_hash['secure_url']
			parameters[:image_remote_id] = image_hash['public_id']
			return parameters
		end
		return false
	end

	def upload_image(image)
		begin
			 return Cloudinary::Uploader.upload(image)
		rescue
			return false
		end
	end

	def update_uploaded_image(image_id)
		begin
			Cloudinary::Uploader.destroy(image_id, :public_id => image_id, :invalidate => true)
		rescue
			return false
		end
	end

	def delete_uploaded_image(image_id)
		begin
			Cloudinary::Uploader.destroy(image_id, :invalidate => true)
		rescue
			return false
		end
	end

	def save_article
		if @article.save
			flash[:notice] = 'Article was successfully created'
			flash[:color] = 'blue'
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end
end
