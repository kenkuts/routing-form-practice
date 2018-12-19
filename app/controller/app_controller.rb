require_relative '../../config/environment'
require_all 'app/models'

class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/add' do
    @post = Post.create(name: params[:name], content: params[:content])

    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all

    erb :posts
  end

  get '/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  post '/delete' do
    Post.find(params[:id]).destroy

    redirect to '/posts'
  end

  post '/post/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])

    erb :edited
  end
end
