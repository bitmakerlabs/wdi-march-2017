class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    puts "Params: #{params[:film][:title]}"

    @film = Film.new(film_params)

    # @film = Film.new(title: params[:film][:title],
    #                   director: params[:film][:director],
    #                   year: params[:film][:year])

    # @film.title = params[:film][:title]
    # @film.director = params[:film][:director]
    # @film.year = params[:film][:year]

    @film.save

    redirect_to films_path
  end

  def film_params
    params.require(:film).permit(:title, :director, :year)
  end
end
