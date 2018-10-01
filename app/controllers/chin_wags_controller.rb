require 'jwt'
require 'smooch-api'

class ChinWagsController < ApplicationController
  before_action :set_chin_wag, only: [:show, :edit, :update, :destroy]

  # GET /chin_wags
  # GET /chin_wags.json
  def index
    @chin_wags = ChinWag.all

    payload = {:scope => 'app'}
    jwtheader = {:kid => Rails.application.credentials.dig(:smooch, :access_key_id)}
    secret = Rails.application.credentials.dig(:smooch, :secret_access_key)

    token = JWT.encode payload, secret, 'HS256', jwtheader


    #puts "### : payload : #{payload}"
    #puts "### : jwtheader : #{jwtheader}"
    #puts "### : secret : #{secret}"
    #puts "### : token : #{token}"

  # Setup authorization
      SmoochApi.configure do |config|
        # Configure API key authorization: jwt
        config.api_key['Authorization'] = token
        config.api_key_prefix['Authorization'] = 'Bearer'
        #config.host = 'api.eu-1.smooch.io'
      end

      api_instance = SmoochApi::AppApi.new

      app_create_body = SmoochApi::AppCreate.new # AppCreate | Body for a createApp request.


      begin
        result = api_instance.create_app(app_create_body) # This is currently throwing an exception (403)
        p result
      rescue SmoochApi::ApiError => e
        puts "Exception when calling AppApi->create_app: #{e}"
      end
  end

  # GET /chin_wags/1
  # GET /chin_wags/1.json
  def show
  end

  # GET /chin_wags/new
  def new
    @chin_wag = ChinWag.new
  end

  # GET /chin_wags/1/edit
  def edit
  end

  # POST /chin_wags
  # POST /chin_wags.json
  def create
    @chin_wag = ChinWag.new(chin_wag_params)

    respond_to do |format|
      if @chin_wag.save
        format.html { redirect_to @chin_wag, notice: 'Chin wag was successfully created.' }
        format.json { render :show, status: :created, location: @chin_wag }
      else
        format.html { render :new }
        format.json { render json: @chin_wag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chin_wags/1
  # PATCH/PUT /chin_wags/1.json
  def update
    respond_to do |format|
      if @chin_wag.update(chin_wag_params)
        format.html { redirect_to @chin_wag, notice: 'Chin wag was successfully updated.' }
        format.json { render :show, status: :ok, location: @chin_wag }
      else
        format.html { render :edit }
        format.json { render json: @chin_wag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chin_wags/1
  # DELETE /chin_wags/1.json
  def destroy
    @chin_wag.destroy
    respond_to do |format|
      format.html { redirect_to chin_wags_url, notice: 'Chin wag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chin_wag
      @chin_wag = ChinWag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chin_wag_params
      params.require(:chin_wag).permit(:message, :text)
    end
end
