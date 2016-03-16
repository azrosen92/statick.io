require 'rails_helper'

RSpec.describe "JsonData", type: :request do
    let(:json_params) { { format: :json } }

    describe "GET /" do
        context "given no endpoint" do
            it "should go to home page" do
                get '/'

                expect(response).to have_http_status :ok
                expect(response).to render_template :new
            end
        end

        context "given an endpoint that exists" do
            let(:json_hash) { { hello: "world", animals: ["cow", "pig", "duck"] } }
            let(:json_datum) { JsonDatum.create({ endpoint: "newendpoint", json_blob: json_hash.to_json }) }

            it "returns the json data at that endoint" do
                get "/#{json_datum.endpoint}", json_params
                
                expect(response).to have_http_status :ok
                expect(parsed_response[:json_blob]).to eq json_datum.json_blob
            end

            it "updates the last accessed date" do
                time_now = Time.zone.now
                Timecop.freeze(time_now) do
                    get "/#{json_datum.endpoint}", json_params
                    json_datum.last_accessed = time_now
                end

            end
        end

        context "given an endpoint that does not exist" do
            it "returns a 404" do
                get "/badendpoint", json_params

                expect(response).to have_http_status(404)
                expect(parsed_response[:message]).to eq I18n.t("errors.not_found")
            end
        end
    end

    describe "POST /json_data" do
        context "with valid json data" do
            let(:params) { { json_datum: { json_blob: { hello: "world" }.to_json } } }

            it "should return a 200, and the new endpoint" do
                post "/json_data", params.merge(json_params)

                expect(response).to have_http_status :created
                expect(parsed_response[:endpoint]).to be_present

                get "/#{parsed_response[:endpoint]}", json_params

                expect(response).to have_http_status :ok
                expect(parsed_response[:json_blob]).to eq params[:json_datum][:json_blob]
            end
        end

        context "with invlalid json data" do
            let(:params) { { json_datum: { json_blob: "hello" } } }

            it "should return an error message" do
                post "/json_data", params.merge(json_params)

                expect(response).to have_http_status :unprocessable_entity
                expect(parsed_response[:json_blob]).to include I18n.t("errors.invalid_json_blob")
            end
        end
    end
end
