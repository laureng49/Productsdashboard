class CommentsController < ApplicationController
  def index
    @comments= Comment.all
  end

def create
  product = Product.find(params[:comment][:product_id])
  product.comments.create(comment: params[:comment][:comment])
  redirect_to "/products/#{product.id}"
  end


end
