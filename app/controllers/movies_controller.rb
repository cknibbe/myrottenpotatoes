# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  
  def search_tmdb
    @movies = Movie.find_in_tmdb(params[:search_terms])
  end
  
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id]           # get id for movie to find
    @movie = Movie.find(id)   # find the movie
  end
  
  def new
    # default: render 'new' template
  end
  
  def create
    @movie = Movie.create!(params[:movie])
    redirect_to movies_path
    flash[:notice] = "#{@movie.title} was successfully created."
  end
  
  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end