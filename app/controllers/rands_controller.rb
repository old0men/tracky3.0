class RandsController < ApplicationController
  before_action :set_rand, only: %i[ show edit update destroy ]

  # GET /rands or /rands.json
  def index
    @rands = Rand.all
  end

  # GET /rands/1 or /rands/1.json
  def show
  end

  # GET /rands/new
  def new
    @rand = Rand.new
  end

  # GET /rands/1/edit
  def edit
  end

  # POST /rands or /rands.json
  def create
    @rand = Rand.new(rand_params)

    respond_to do |format|
      if @rand.save
        format.html { redirect_to @rand, notice: "Rand was successfully created." }
        format.json { render :show, status: :created, location: @rand }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @rand.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /rands/1 or /rands/1.json
  def update
    respond_to do |format|
      if @rand.update(rand_params)
        format.html { redirect_to @rand, notice: "Rand was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @rand }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @rand.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /rands/1 or /rands/1.json
  def destroy
    @rand.destroy!

    respond_to do |format|
      format.html { redirect_to rands_path, notice: "Rand was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rand
      @rand = Rand.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def rand_params
      params.expect(rand: [ :name, :age, :height ])
    end
end
