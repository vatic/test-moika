require "spec_helper"

describe CarWashesController do
  describe "routing" do

    it "routes to #index" do
      get("/car_washes").should route_to("car_washes#index")
    end

    it "routes to #new" do
      get("/car_washes/new").should route_to("car_washes#new")
    end

    it "routes to #show" do
      get("/car_washes/1").should route_to("car_washes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/car_washes/1/edit").should route_to("car_washes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/car_washes").should route_to("car_washes#create")
    end

    it "routes to #update" do
      put("/car_washes/1").should route_to("car_washes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/car_washes/1").should route_to("car_washes#destroy", :id => "1")
    end

  end
end
