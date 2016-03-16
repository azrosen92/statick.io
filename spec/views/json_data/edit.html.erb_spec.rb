require 'rails_helper'

RSpec.describe "json_data/edit", type: :view do
  before(:each) do
    @json_datum = assign(:json_datum, JsonDatum.create!(
      json_blob: { hello: "world" }.to_json
    ))
  end

  it "renders the edit json_datum form" do
    render

    assert_select "form[action=?][method=?]", json_datum_path(@json_datum), "post" do

      assert_select "textarea#json_datum_json_blob[name=?]", "json_datum[json_blob]"
    end
  end
end
