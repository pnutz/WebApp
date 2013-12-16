require "spec_helper"

describe ReceiptItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/receipt_items").should route_to("receipt_items#index")
    end

    it "routes to #new" do
      get("/receipt_items/new").should route_to("receipt_items#new")
    end

    it "routes to #show" do
      get("/receipt_items/1").should route_to("receipt_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/receipt_items/1/edit").should route_to("receipt_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/receipt_items").should route_to("receipt_items#create")
    end

    it "routes to #update" do
      put("/receipt_items/1").should route_to("receipt_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/receipt_items/1").should route_to("receipt_items#destroy", :id => "1")
    end

  end
end
