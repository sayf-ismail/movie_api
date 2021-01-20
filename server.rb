require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do
    erb :index
end

get '/movies_list' do
    movie_search_s = params['user-input']
    movie1 = HTTParty.get('https://omdbapi.com/?apikey=#&s=' + movie_search_s)

    movies = movie1["Search"]

    erb :movies_list, locals: {
        movies: movies,
        movie_search_s: movie_search_s,
    }
end

get '/results' do
    movie_search = params['user-input']
    movie_hash = HTTParty.get('https://omdbapi.com/?apikey=#&t='+ movie_search)

    movietitle = movie_hash["Title"]
    actors = movie_hash["Actors"]
    plot = movie_hash["Plot"]
    poster = movie_hash["Poster"]
    language = movie_hash["Language"]
    awards = movie_hash["Awards"]

    erb :results, locals: {
        movietitle: movietitle,
        actors: actors,
        plot: plot,
        poster: poster,
        language: language,
        awards: awards,

    }
end