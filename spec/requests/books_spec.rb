require 'rails_helper'

RSpec.describe 'Books Spec', type: :request do
  # Just for the general check
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
      expect(JSON.parse(response.body)).to include(
        "title" => "Taller Challenge"
        )
    end
  end

  describe 'POST /books/:id/reserve' do
    let!(:book) { Book.create(title: 'Taller Challenge') }

    context 'when the books is available' do
      it 'reserves the book sucessfully' do
        email = "john@doe.com"
        post "/books/#{book.id}/reserve",
              params: { user_email: "john@doe.com" }

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include(
          "status" => "reserved",
          "user_email" => email
          )
      end
    end

    context "when the books is reserved" do
      before do
        book.update(status: 'reserved', user_email: 'doe@joe.com')
      end

      it 'returns an error' do
        post "/books/#{book.id}/reserve", params: { user_email: "john@doe.com" }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include(
          'error' => "Book is already reserved"
        )
      end
    end

    # context 'when the user_email is not provided' do (not generated for the time)
    # end
  end
end
