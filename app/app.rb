ENV['RACK_ENV'] ||="development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                  title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to ('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  run! if app_file == $0

end
