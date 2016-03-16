class JsonDataController < ApplicationController
    before_action :set_json_datum, only: [:edit, :update, :destroy]

    # GET /json_data
    # GET /json_data.json
    def index
        @json_data = JsonDatum.all
    end


    # GET /json_data/<endpoint>
    # GET /json_data/<endpoint>.json
    def show
        @json_datum = JsonDatum.find_by(endpoint: params[:endpoint])

        respond_to do |format|
            if @json_datum.present?
                @json_datum.access

                format.html { render :show, data: @json_datum }
                format.json { render :show, status: :ok, location: @json_datum }
            else
                format.html { render :show, notice: I18n.t('errors.not_found') }
                format.json { render status: :not_found, json: { message: I18n.t('errors.not_found') } }
            end
        end
    end

    # GET /json_data/new
    def new
        @json_datum = JsonDatum.new
    end

    # GET /json_data/1/edit
    def edit
    end

    # POST /json_data
    # POST /json_data.json
    def create
        @json_datum = JsonDatum.new(json_datum_params)

        respond_to do |format|
            if @json_datum.save
                format.html { redirect_to @json_datum, notice: 'Json datum was successfully created.' }
                format.json { render :show, status: :created, location: @json_datum }
            else
                format.html { render :new }
                format.json { render json: @json_datum.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /json_data/1
    # PATCH/PUT /json_data/1.json
    def update
        respond_to do |format|
            if @json_datum.update(json_datum_params)
                format.html { redirect_to @json_datum, notice: 'Json datum was successfully updated.' }
                format.json { render :show, status: :ok, location: @json_datum }
            else
                format.html { render :edit }
                format.json { render json: @json_datum.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /json_data/1
    # DELETE /json_data/1.json
    def destroy
        @json_datum.destroy
        respond_to do |format|
            format.html { redirect_to json_data_url, notice: 'Json datum was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_json_datum
            @json_datum = JsonDatum.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def json_datum_params
            params.require(:json_datum).permit(:endpoint, :json_blob)
        end
end
