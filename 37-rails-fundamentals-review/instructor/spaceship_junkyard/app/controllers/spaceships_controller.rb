class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
    # @spaceship.crew_members.build
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)

    # @spaceship.image_url = params[:spaceship][:image_url]
    # @spaceship.crew_members_attributes = params[:spaceship][:crew_members_attributes]

    if @spaceship.save
      redirect_to spaceships_path, notice: 'Spaceship saved!'
    else
      render :new
    end
  end

  def update
    @spaceship = Spaceship.find(params[:id])

    if @spaceship.update_attributes(spaceship_params)
      redirect_to spaceship_path(@spaceship), notice: 'Spaceship saved!'
    else
      render :edit
    end
  end

  def destroy
    Spaceship.find(params[:id]).destroy
    redirect_to spaceships_url, notice: 'Spaceship deleted!'
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name,
                                      :universe,
                                      :max_speed,
                                      :image_url,
                                      :history,
                                      crew_members_attributes: [
                                        :first_name,
                                        :last_name,
                                        :rank
                                      ])
  end
end
