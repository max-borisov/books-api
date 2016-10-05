describe BooksController do
  let(:token) { 'paladin' }

  describe 'GET #index' do
    it 'returns http status 401 for invalid token' do
      get :index

      expect(response).to have_http_status(401)
    end

    it 'returnes json for books list and http status 200' do
      book = FactoryGirl.create(:book, title: 'test', description: 'desc')

      get :index, token: token

      expect(response.body).to eq([book].to_json)
      expect(response).to have_http_status(200)
    end

  end

  describe 'POST #create' do
    it 'returnes json for a new book and http status 201' do
      post :create, book: { title: 'title', description: 'description' }, token: token

      expect(response.body).to include('title')
      expect(response.body).to include('description')
      expect(response).to have_http_status(201)
    end

    it 'returnes json with validation errors and http status 400' do
      post :create, book: { title:'', description: '' }, token: token

      expect(JSON.parse(response.body).has_key?('title')).to be true
      expect(JSON.parse(response.body).has_key?('description')).to be true
      expect(response).to have_http_status(400)
    end
  end

  describe 'PUT #update' do
    it 'returnes json for updated book and http status 200' do
      book = FactoryGirl.create(:book)

      put :update, id: book.id, token: token,
        book: { title: 'new title', description: 'new description' }

      expect(response.body).to include('new title')
      expect(response.body).to include('new description')
      expect(response).to have_http_status(200)
    end

    it 'returnes json with validation and http status 400' do
      book = FactoryGirl.create(:book)

      put :update, id: book.id, token: token, book: { title: '', description: '' }

      expect(JSON.parse(response.body).has_key?('title')).to be true
      expect(JSON.parse(response.body).has_key?('description')).to be true
      expect(response).to have_http_status(400)
    end
  end

  describe 'POST #destroy' do
    it 'returnes status code 400 if book could not be found' do
      post :destroy, id: 1, token: token

      expect(response).to have_http_status(404)
    end

    it 'returnes book json and status code 200' do
      book = FactoryGirl.create(:book)

      post :destroy, id: book.id, token: token

      expect(response.body).to eq(book.to_json)
      expect(response).to have_http_status(200)
    end

    it 'returnes status code 500 if book could not be destroied' do
      book = FactoryGirl.create(:book)

      Book.any_instance.stub(:destroy).and_return(false)
      post :destroy, id: book.id, token: token

      expect(response).to have_http_status(500)
    end
  end
end
