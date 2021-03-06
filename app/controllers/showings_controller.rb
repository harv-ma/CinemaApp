class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy, :book]
  before_action :validateAdmin, only: [:edit, :update, :destroy, :create, :indexAdmin, :new]

  # Booking page showings/:id/book
  def book
  end

  # GET /showings
  # GET /showings.json
  def index

    # get all showings for next 7 days
    @showings = Showing.inTheNextWeek
    
    @films = @showings.map{ |s| s.film} # get only the film objects
    @films = @films.uniq { |f| f.title } # remove duplicates

  end

  def indexAdmin
    @showings = Showing.all
  end

  # GET /showings/1
  # GET /showings/1.json
  def show
  end

  # GET /showings/new
  def new
    @showing = Showing.new
  end

  # GET /showings/1/edit
  def edit
  end

  # POST /showings
  # POST /showings.json
  def create
    @showing = Showing.new(showing_params)
    @showing.finishTime = @showing.startTime + @showing.film.duration.hours

    respond_to do |format|
      if @showing.save
        format.html { redirect_to @showing, notice: 'Showing was successfully created.' }
        format.json { render :show, status: :created, location: @showing }
      else
        format.html { render :new }
        format.json { render json: @showing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showings/1
  # PATCH/PUT /showings/1.json
  def update
    respond_to do |format|
      if @showing.update(showing_params)
        format.html { redirect_to @showing, notice: 'Showing was successfully updated.' }
        format.json { render :show, status: :ok, location: @showing }
      else
        format.html { render :edit }
        format.json { render json: @showing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showings/1
  # DELETE /showings/1.json
  def destroy
    @showing.destroy
    respond_to do |format|
      format.html { redirect_to showings_url, notice: 'Showing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showing
      @showing = Showing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def showing_params
      params.require(:showing).permit(:startTime, :film_id, :room_id)
    end
end
