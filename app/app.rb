require 'sinatra/base'
require_relative './models/link'

class BookmarkManagerWeb < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  run! if app_file == $0

end
