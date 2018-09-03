require "rails_helper"

RSpec.describe TastingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tastings").to route_to("tastings#index")
    end


    it "routes to #show" do
      expect(:get => "/tastings/1").to route_to("tastings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tastings").to route_to("tastings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tastings/1").to route_to("tastings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tastings/1").to route_to("tastings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tastings/1").to route_to("tastings#destroy", :id => "1")
    end

  end
end
