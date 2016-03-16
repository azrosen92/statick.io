require 'rails_helper'

RSpec.describe "json_data/show", type: :view do
  before(:each) do
    @json_hash = { hello: "world" }

    @json_datum = assign(:json_datum, JsonDatum.create!(
      :endpoint => "Endpoint",
      :json_blob => @json_hash.to_json
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Endpoint/)
    expect(rendered).to match(@json_hash.to_json)
  end
end
