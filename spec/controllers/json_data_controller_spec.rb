require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe JsonDataController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # JsonDatum. As you add validations to JsonDatum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { json_blob: { hello: "world" }.to_json } 
  }

  let(:invalid_attributes) {
    { json_blob: "" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JsonDataController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all json_data as @json_data" do
      json_datum = JsonDatum.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:json_data)).to eq([json_datum])
    end
  end

  describe "GET #show" do
    it "assigns the requested json_datum as @json_datum" do
      json_datum = JsonDatum.create! valid_attributes
      get :show, { endpoint: json_datum.endpoint }, valid_session
      expect(assigns(:json_datum)).to eq(json_datum)
    end
  end

  describe "GET #new" do
    it "assigns a new json_datum as @json_datum" do
      get :new, {}, valid_session
      expect(assigns(:json_datum)).to be_a_new(JsonDatum)
    end
  end

  describe "GET #edit" do
    it "assigns the requested json_datum as @json_datum" do
      json_datum = JsonDatum.create! valid_attributes
      get :edit, {:id => json_datum.to_param}, valid_session
      expect(assigns(:json_datum)).to eq(json_datum)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new JsonDatum" do
        expect {
          post :create, {:json_datum => valid_attributes}, valid_session
        }.to change(JsonDatum, :count).by(1)
      end

      it "assigns a newly created json_datum as @json_datum" do
        post :create, {:json_datum => valid_attributes}, valid_session
        expect(assigns(:json_datum)).to be_a(JsonDatum)
        expect(assigns(:json_datum)).to be_persisted
      end

      it "redirects to the created json_datum" do
        post :create, {:json_datum => valid_attributes}, valid_session
        expect(response).to redirect_to(JsonDatum.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved json_datum as @json_datum" do
        post :create, {:json_datum => invalid_attributes}, valid_session
        expect(assigns(:json_datum)).to be_a_new(JsonDatum)
      end

      it "re-renders the 'new' template" do
        post :create, {:json_datum => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { json_blob: { hello: "world"}.to_json }
      }

      it "updates the requested json_datum" do
        json_datum = JsonDatum.create! valid_attributes
        put :update, {:id => json_datum.to_param, :json_datum => new_attributes}, valid_session
        json_datum.reload
        expect(json_datum.json_blob).to eq new_attributes[:json_blob]
      end

      it "assigns the requested json_datum as @json_datum" do
        json_datum = JsonDatum.create! valid_attributes
        put :update, {:id => json_datum.to_param, :json_datum => valid_attributes}, valid_session
        expect(assigns(:json_datum)).to eq(json_datum)
      end

      it "redirects to the json_datum" do
        json_datum = JsonDatum.create! valid_attributes
        put :update, {:id => json_datum.to_param, :json_datum => valid_attributes}, valid_session
        expect(response).to redirect_to(json_datum)
      end
    end

    context "with invalid params" do
      it "assigns the json_datum as @json_datum" do
        json_datum = JsonDatum.create! valid_attributes
        put :update, {:id => json_datum.to_param, :json_datum => invalid_attributes}, valid_session
        expect(assigns(:json_datum)).to eq(json_datum)
      end

      it "re-renders the 'edit' template" do
        json_datum = JsonDatum.create! valid_attributes
        put :update, {:id => json_datum.to_param, :json_datum => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested json_datum" do
      json_datum = JsonDatum.create! valid_attributes
      expect {
        delete :destroy, {:id => json_datum.to_param}, valid_session
      }.to change(JsonDatum, :count).by(-1)
    end

    it "redirects to the json_data list" do
      json_datum = JsonDatum.create! valid_attributes
      delete :destroy, {:id => json_datum.to_param}, valid_session
      expect(response).to redirect_to(json_data_url)
    end
  end

end
