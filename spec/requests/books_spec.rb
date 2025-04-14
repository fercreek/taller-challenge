require 'rails_helper'

RSpec.describe 'Books Spec', type: :request do
  describe 'GET /books' do
    it 'returns a book list' do
      get '/books'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to be_a(Array)
    end
  end

  describe 'POST /books' do
    it 'creates a book' do
      post '/books', params: { book: { title: 'Taller Challenge' } }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include("title" => "Taller Challenge")
    end
  end
end
