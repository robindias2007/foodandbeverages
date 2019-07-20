class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :only => [:index, :new, :create, :update, :index_edit]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
    @skip_header = true;
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_edit_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to foods_edit_path, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_edit_path, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index_edit
    @foods = Food.order(created_at: :desc).all
    @food = Food.find(params[:format]) rescue nil
      if params[:commit] == 'Update'         
        @food.update_attributes(food_params)   
        redirect_back fallback_location: foods_edit_path
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :high_price, :low_price, :normal_price, :quantity, :weight, :category)
    end

    def authenticate_admin
      authenticate_admin!
    end
end






