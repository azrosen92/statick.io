require 'rails_helper'

RSpec.describe "json_data/new", type: :view do
    before(:each) do
        json_hash = { hello: "world" }

        assign(:json_datum, JsonDatum.new(
            endpoint: "MyString",
            json_blob: json_hash.to_json
        ))
    end

    it "renders new json_datum form" do
        render

        assert_select "form[action=?][method=?]", json_data_path, "post" do
            assert_select "textarea#json_datum_json_blob[name=?]", "json_datum[json_blob]"
        end
    end
end