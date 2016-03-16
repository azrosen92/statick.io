require "rails_helper"

RSpec.describe JsonDataController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/json_data").to route_to("json_data#index")
    end

    it "routes to #new" do
      expect(:get => "/").to route_to("json_data#new")
    end

    it "routes to #edit" do
      expect(:get => "/json_data/1/edit").to route_to("json_data#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/json_data").to route_to("json_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/json_data/1").to route_to("json_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/json_data/1").to route_to("json_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/json_data/1").to route_to("json_data#destroy", :id => "1")
    end

  end
end
