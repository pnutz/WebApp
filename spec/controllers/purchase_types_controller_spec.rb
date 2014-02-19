require 'spec_helper'

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

describe PurchaseTypesController do

  # This should return the minimal set of attributes required to create a valid
  # PurchaseType. As you add validations to PurchaseType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PurchaseTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all purchase_types as @purchase_types" do
      purchase_type = PurchaseType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:purchase_types).should eq([purchase_type])
    end
  end

  describe "GET show" do
    it "assigns the requested purchase_type as @purchase_type" do
      purchase_type = PurchaseType.create! valid_attributes
      get :show, {:id => purchase_type.to_param}, valid_session
      assigns(:purchase_type).should eq(purchase_type)
    end
  end

  describe "GET new" do
    it "assigns a new purchase_type as @purchase_type" do
      get :new, {}, valid_session
      assigns(:purchase_type).should be_a_new(PurchaseType)
    end
  end

  describe "GET edit" do
    it "assigns the requested purchase_type as @purchase_type" do
      purchase_type = PurchaseType.create! valid_attributes
      get :edit, {:id => purchase_type.to_param}, valid_session
      assigns(:purchase_type).should eq(purchase_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PurchaseType" do
        expect {
          post :create, {:purchase_type => valid_attributes}, valid_session
        }.to change(PurchaseType, :count).by(1)
      end

      it "assigns a newly created purchase_type as @purchase_type" do
        post :create, {:purchase_type => valid_attributes}, valid_session
        assigns(:purchase_type).should be_a(PurchaseType)
        assigns(:purchase_type).should be_persisted
      end

      it "redirects to the created purchase_type" do
        post :create, {:purchase_type => valid_attributes}, valid_session
        response.should redirect_to(PurchaseType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved purchase_type as @purchase_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseType.any_instance.stub(:save).and_return(false)
        post :create, {:purchase_type => {  }}, valid_session
        assigns(:purchase_type).should be_a_new(PurchaseType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseType.any_instance.stub(:save).and_return(false)
        post :create, {:purchase_type => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested purchase_type" do
        purchase_type = PurchaseType.create! valid_attributes
        # Assuming there are no other purchase_types in the database, this
        # specifies that the PurchaseType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PurchaseType.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => purchase_type.to_param, :purchase_type => { "these" => "params" }}, valid_session
      end

      it "assigns the requested purchase_type as @purchase_type" do
        purchase_type = PurchaseType.create! valid_attributes
        put :update, {:id => purchase_type.to_param, :purchase_type => valid_attributes}, valid_session
        assigns(:purchase_type).should eq(purchase_type)
      end

      it "redirects to the purchase_type" do
        purchase_type = PurchaseType.create! valid_attributes
        put :update, {:id => purchase_type.to_param, :purchase_type => valid_attributes}, valid_session
        response.should redirect_to(purchase_type)
      end
    end

    describe "with invalid params" do
      it "assigns the purchase_type as @purchase_type" do
        purchase_type = PurchaseType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseType.any_instance.stub(:save).and_return(false)
        put :update, {:id => purchase_type.to_param, :purchase_type => {  }}, valid_session
        assigns(:purchase_type).should eq(purchase_type)
      end

      it "re-renders the 'edit' template" do
        purchase_type = PurchaseType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseType.any_instance.stub(:save).and_return(false)
        put :update, {:id => purchase_type.to_param, :purchase_type => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested purchase_type" do
      purchase_type = PurchaseType.create! valid_attributes
      expect {
        delete :destroy, {:id => purchase_type.to_param}, valid_session
      }.to change(PurchaseType, :count).by(-1)
    end

    it "redirects to the purchase_types list" do
      purchase_type = PurchaseType.create! valid_attributes
      delete :destroy, {:id => purchase_type.to_param}, valid_session
      response.should redirect_to(purchase_types_url)
    end
  end

end