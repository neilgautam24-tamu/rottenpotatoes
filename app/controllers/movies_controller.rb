class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction
  
  def index
    @movies = Movie.order("#{sort_column} #{sort_direction}")
    # Store sorting and direction in the session
    session[:sort] = params[:sort] || "title" 
    session[:direction] = params[:direction] || "asc"  
    session[:previous_url] = request.fullpath
  end

  def new
    @movie = Movie.new
  end

  def sort_column
    Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        # Redirect to the newly created movie page with a 'Back to Movies' button
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie, sort: session[:sort], direction: session[:direction]), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_path(sort: session[:sort], direction: session[:direction]), notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
