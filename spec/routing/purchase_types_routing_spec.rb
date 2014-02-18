require "spec_helper"

describe PurchaseTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/purchase_types").should route_to("purchase_types#index")
    end

    it "routes to #new" do
      get("/purchase_types/new").should route_to("purchase_types#new")
    end

    it "routes to #show" do
      get("/purchase_types/1").should route_to("purchase_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/purchase_types/1/edit").should route_to("purchase_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/purchase_types").should route_to("purchase_types#create")
    end

    it "routes to #update" do
      put("/purchase_types/1").should route_to("purchase_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/purchase_types/1").should route_to("purchase_types#destroy", :id => "1")
    end

  end
end
