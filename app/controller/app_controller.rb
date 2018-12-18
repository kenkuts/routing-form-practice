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
end
