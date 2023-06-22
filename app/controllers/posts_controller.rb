class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  # def update
  #   post = Post.find(params[:id])

  #   if post.update(post_params)
  #     render json: post
  #   else
  #     render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end
  # def update
  #   post = Post.find(params[:id])
  
  #   if post.update(post_params)
  #     render json: post, status: :ok
  #   else
  #     render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end
#   def update
#     post = Post.find(params[:id])
   
#     if post.update(post_params)
#       render json: post, status: :ok
#     else
#       render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
#     end
 
# rescue ActiveRecord::RecordInvalid => invalid
#   render json: { errors: invalid.record.errors }, status: :unprocessable_entity
# end
def update
  post = Post.find(params[:id])

  if post.update(post_params)
    render json: post, status: :ok
  else
    render json: { errors: post.errors }, status: :unprocessable_entity
  end
rescue ActiveRecord::RecordNotFound
  render json: { errors: 'Post not found' }, status: :not_found
end


  
  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
