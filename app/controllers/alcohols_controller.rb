class AlcoholsController < ApplicationController
  before_action :set_alcohol, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :only => [:new, :create, :update, :index_edit]

  # GET /alcohols
  # GET /alcohols.json
  def index
    @alcohols = Alcohol.order(created_at: :desc).all
    @skip_header = true;
  end

  # GET /alcohols/1
  # GET /alcohols/1.json
  def show
  end

  # GET /alcohols/new
  def new
    @alcohol = Alcohol.new
  end

  # GET /alcohols/1/edit
  def edit
  end

  # POST /alcohols
  # POST /alcohols.json
  def create
    @alcohol = Alcohol.new(alcohol_params)

    respond_to do |format|
      if @alcohol.save
        format.html { redirect_to alcohols_edit_path, notice: 'Beverage was successfully created.' }
        format.json { render :show, status: :created, location: @alcohol }
      else
        format.html { render :new }
        format.json { render json: @alcohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alcohols/1
  # PATCH/PUT /alcohols/1.json
  def update
    respond_to do |format|
      if @alcohol.update(alcohol_params)
        format.html { redirect_to alcohols_edit_path, notice: 'Beverage was successfully updated.' }
        format.json { render :show, status: :ok, location: @alcohol }
      else
        format.html { render :edit }
        format.json { render json: @alcohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alcohols/1
  # DELETE /alcohols/1.json
  def destroy
    @alcohol.destroy
    respond_to do |format|
      format.html { redirect_to alcohols_edit_path , notice: 'Beverage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index_edit
    @alcohols = Alcohol.order(created_at: :desc).all
    @alcohol = Alcohol.find(params[:format]) rescue nil
      if params[:commit] == 'Update'         
        @alcohol.update_attributes(alcohol_params)   
        redirect_back fallback_location: alcohols_edit_path
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alcohol
      @alcohol = Alcohol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alcohol_params
      params.require(:alcohol).permit(:name, :high_price, :low_price, :standard_price, :weight, :quantity, :category)
    end

    def authenticate_admin
      authenticate_admin!
    end
end
