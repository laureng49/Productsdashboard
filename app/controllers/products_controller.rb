class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
    @product = Product.joins(:category).select(:id, :name, :description, :pricing, :category_id, "categories.name as c_name").find(params[:id])
    @comments = @product.comments

  end

  def new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def create
    category = Category.find(params[:id])
    @product = Product.create(name: params[:name], description: params[:description], pricing: params[:pricing], category: category)
    redirect_to '/products'
  end

  def update
    category = Category.find(params[:id])
    @product = Product.find(params[:productid]).update(name: params[:name], description: params[:description], pricing: params[:pricing], category: category)
    redirect_to '/products/'+params[:productid].to_s
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :back
  end
end
