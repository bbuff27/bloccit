require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:new_ad) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..100)) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [new_ad] to @advertisement" do
      get :index
      expect(assigns(:ads)).to eq([new_ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: new_ad.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: new_ad.id }
      expect(response).to render_template(:show)
    end

    it "assignes new_ad to @post" do
      get :show, params: { id: new_ad.id }
      expect(assigns(:ad)).to eq(new_ad)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @ad" do
      get :new
      expect(assigns(:ad)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of Advertisement by 1" do
      expect{ post :create, params: {ad: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..100)}} }.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @ad" do
      post :create, params: {ad: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..100)}}
      expect(assigns(:ad)).to eq(Advertisement.last)
    end

    it "redirects to the new advertisement" do 
      post :create, params: {ad: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..100)}}
      expect(response).to redirect_to(Advertisement.last)
    end
  end

end
