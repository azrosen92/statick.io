require 'rails_helper'

RSpec.describe JsonDatum, type: :model do
    let(:json_datum) { JsonDatum.new(json_blob: { hello: "world"}.to_json) }

    describe 'validating' do
        it 'passes validations' do
            expect(json_datum).to be_valid
        end

        context 'when saving without json_blob' do
            before do
                json_datum.json_blob = nil
            end

            it 'is not valid' do
                expect(json_datum).not_to be_valid
                expect(json_datum.errors.messages[:json_blob]).to include(I18n.t("errors.invalid_json_blob"))
            end
        end

        context 'when saving with invalid json' do
            before do
                json_datum.json_blob = ""
            end

            it 'is not valid' do
                expect(json_datum).not_to be_valid
                expect(json_datum.errors.messages[:json_blob]).to include("can't be blank")
            end
        end
    end

    context 'when creating a valid json_datum' do
        let(:json_datum) { JsonDatum.create(json_blob: { hello: "world"}.to_json) }

        it 'should generate a url endpoint' do
            expect(json_datum.endpoint).to be_present
        end
    end

    describe '#access' do
        it 'should set last_accessed to Time.zone.now' do
            Timecop.freeze(Time.zone.now) do
                json_datum.access
                expect(json_datum.last_accessed).to eq Time.zone.now
            end
        end
    end
end
