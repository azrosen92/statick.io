require 'rails_helper'

RSpec.describe "json_data/index", type: :view do
  let(:json_data) do 
    [
      JsonDatum.create!(
        :endpoint => "Endpoint",
        :json_blob => { hello: 'world' }.to_json
      ),
      JsonDatum.create!(
        :endpoint => "Endpoint",
        :json_blob => { hello: 'world' }.to_json
      )    
    ] 
  end

  before(:each) do
    assign(:json_data, json_data)
  end

  it "renders a list of json_data" do
    render
    assert_select "tr>td", :text => json_data.first.endpoint, :count => 1
    assert_select "tr>td", :text => json_data.second.endpoint, :count => 1
    assert_select "tr>td", :text => { hello: 'world' }.to_json, :count => 2
  end
end
