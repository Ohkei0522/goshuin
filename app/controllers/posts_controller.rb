class PostsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search].nil? || params[:search].empty?
        @posts = Post.all
      else
        @posts = Post.where("body LIKE ?", "%" + params[:search] + "%")
      end   

      if params[:tag]
        Tag.create(name: params[:tag])
      end

      if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_tweets = Tag.find_by(name: key).tweets
              @posts = @posts.empty? ? tag_tweets : @posts & tag_tweets
            end
          end
        end
      end

    def new
        @post = Post.new
        @tags = Tag.all
    end
    
    def create
        post = Post.new(post_params)
        if post.save
          redirect_to :action => "index"
        else
          rendder :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end
  
    def edit
      @post = Post.find(params[:id])  
    end
    
    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        redirect_to :action => "show", :id => post.id
      else
        render :edit
      end
    end
    
    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index

    end

    private  

    def post_params
       params.require(:post).permit(:body, :image, tags_ids:[])
    end
   
end
