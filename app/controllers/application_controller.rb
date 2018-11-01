
require_relative '../../config/environment'
require_relative '../models/post'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    args = {name: params[:name], content: params[:content]}
    @post = Post.create(args)
    erb :index
  end
end
