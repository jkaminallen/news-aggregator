require 'sinatra'
require 'pry'
require 'csv'

get '/articles/new' do
  erb :index
end

post '/articles/new' do
  title = params['title']
  description = params['description']
  url = params['url']

  CSV.open('articles.csv', 'a') do |csv|
    csv << [title, description, url]
  end
  redirect '/articles/new'
end

get '/articles' do
  @articles = CSV.readlines('articles.csv')
  erb :saved_articles
end

get '/articles/:url' do
  erb :url
end
