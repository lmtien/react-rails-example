require 'rails_helper'

RSpec.describe ImportersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all importers as @importers" do
      importer = Importer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:importers)).to eq([importer])
    end
  end

  describe "GET #show" do
    it "assigns the requested importer as @importer" do
      importer = Importer.create! valid_attributes
      get :show, params: {id: importer.to_param}, session: valid_session
      expect(assigns(:importer)).to eq(importer)
    end
  end

  describe "GET #new" do
    it "assigns a new importer as @importer" do
      get :new, params: {}, session: valid_session
      expect(assigns(:importer)).to be_a_new(Importer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested importer as @importer" do
      importer = Importer.create! valid_attributes
      get :edit, params: {id: importer.to_param}, session: valid_session
      expect(assigns(:importer)).to eq(importer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Importer" do
        expect {
          post :create, params: {importer: valid_attributes}, session: valid_session
        }.to change(Importer, :count).by(1)
      end

      it "assigns a newly created importer as @importer" do
        post :create, params: {importer: valid_attributes}, session: valid_session
        expect(assigns(:importer)).to be_a(Importer)
        expect(assigns(:importer)).to be_persisted
      end

      it "redirects to the created importer" do
        post :create, params: {importer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Importer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved importer as @importer" do
        post :create, params: {importer: invalid_attributes}, session: valid_session
        expect(assigns(:importer)).to be_a_new(Importer)
      end

      it "re-renders the 'new' template" do
        post :create, params: {importer: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested importer" do
        importer = Importer.create! valid_attributes
        put :update, params: {id: importer.to_param, importer: new_attributes}, session: valid_session
        importer.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested importer as @importer" do
        importer = Importer.create! valid_attributes
        put :update, params: {id: importer.to_param, importer: valid_attributes}, session: valid_session
        expect(assigns(:importer)).to eq(importer)
      end

      it "redirects to the importer" do
        importer = Importer.create! valid_attributes
        put :update, params: {id: importer.to_param, importer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(importer)
      end
    end

    context "with invalid params" do
      it "assigns the importer as @importer" do
        importer = Importer.create! valid_attributes
        put :update, params: {id: importer.to_param, importer: invalid_attributes}, session: valid_session
        expect(assigns(:importer)).to eq(importer)
      end

      it "re-renders the 'edit' template" do
        importer = Importer.create! valid_attributes
        put :update, params: {id: importer.to_param, importer: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested importer" do
      importer = Importer.create! valid_attributes
      expect {
        delete :destroy, params: {id: importer.to_param}, session: valid_session
      }.to change(Importer, :count).by(-1)
    end

    it "redirects to the importers list" do
      importer = Importer.create! valid_attributes
      delete :destroy, params: {id: importer.to_param}, session: valid_session
      expect(response).to redirect_to(importers_url)
    end
  end

end
