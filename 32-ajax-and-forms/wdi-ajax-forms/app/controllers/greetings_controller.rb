class GreetingsController < ApplicationController

  def index
    @greetings = Greeting.all.order(created_at: :desc)
    @greeting = Greeting.new
  end

  def create
    @greeting = Greeting.new(greeting_params)

    respond_to do |format|
      format.html do
        if request.xhr?
          if @greeting.save
            # render partial: 'greeting', locals: { greeting: @greeting }
            render @greeting
          end
        else
          if @greeting.save
            redirect_to greetings_path
          else
            @greetings = Greeting.all.order(created_at: :desc)
            render :index
          end
        end
      end

      format.json do
        if @greeting.save
          render json: @greeting
        end
      end
    end

    # if request.xhr?
    #   # This request was made with AJAX
    #   if @greeting.save
    #     # render plain: 'goodbye'
    #     # render html: "<li>#{@greeting.note}</li>"
    #     # render partial: 'greeting'
    #     render json: @greeting
    #   else
    #   end
    # else
    #   if @greeting.save
    #     redirect_to greetings_path
    #   else
    #     @greetings = Greeting.all.order(created_at: :desc)
    #     render :index
    #   end
    # end
  end

  private

  def greeting_params
    params.require(:greeting).permit(:note)
  end

end
