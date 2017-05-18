class PagesController < ApplicationController

  def index

  end

  def show
    if params[:id].to_i == 0
      @page = Page.find_by_slug(params[:id])
    else
      @page = Page.find(params[:id])
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new
    @page.slug = params[:page][:slug]
    @page.title = params[:page][:title]
    @page.content = params[:page][:content]

    if @page.save
      flash.notice = 'Saved'
      redirect_to pages_url
    else
      flash.now[:error] = 'Could not save'
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.slug = params[:page][:slug]
    @page.title = params[:page][:title]
    @page.content = params[:page][:content]

    if @page.save
      flash.notice = 'Saved'
      redirect_to "/pages/#{@page.id}"
    else
      flash.now[:error] = 'Could not save'
      render :edit
    end
  end

  def destroy
    flash.notice = 'Page deleted'
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end

end
