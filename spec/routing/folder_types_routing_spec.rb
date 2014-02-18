require "spec_helper"

describe FolderTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/folder_types").should route_to("folder_types#index")
    end

    it "routes to #new" do
      get("/folder_types/new").should route_to("folder_types#new")
    end

    it "routes to #show" do
      get("/folder_types/1").should route_to("folder_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/folder_types/1/edit").should route_to("folder_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/folder_types").should route_to("folder_types#create")
    end

    it "routes to #update" do
      put("/folder_types/1").should route_to("folder_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/folder_types/1").should route_to("folder_types#destroy", :id => "1")
    end

  end
end
