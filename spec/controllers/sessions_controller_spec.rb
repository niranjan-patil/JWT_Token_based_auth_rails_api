#require 'moviesdata'
require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
 describe 'Movies API' do
   before(:each) do
     FactoryBot.create_list(:random_movie, 9)
   end
   let!(:movie) {create :random_movie}
   it 'it should return list of movies' do
     get '/api/v1/movies'
     expect(response.status).to eq(200)
     json = JSON.parse(response.body)
     expect(response).to be_success
     expect(json['data'].length).to eq(10)
   end

   it 'it should return one json object to show one movie' do
     get "/api/v1/movies/#{movie.id}"
     expect(response.status).to eq(200)
     json = JSON.parse(response.body)
     expect(json['data']['name']).to eq(movie.name)
     expect(json['data']['description']).to eq(movie.description)
     expect(json['data']['rating']).to eq(movie.rating)
   end

    it 'ensure delete movie object which is requested' do
     delete "/api/v1/movies/#{movie.id}"
     expect(response.status).to eq(200)
     json = JSON.parse(response.body)
     expect(json['message']).to eq(I18n.t('movie_delete'))
    end
 end
end