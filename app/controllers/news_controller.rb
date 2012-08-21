class NewsController < ApplicationController
   skip_before_filter :authorize, only: [:index, :show]
    
  # GET /news
  # GET /news.json
  def index
    @news = News.paginate page: params[:page], order: 'created_at desc',
        per_page: 5

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    begin
      @news = News.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid news #{params[:id]}"
      redirect_to news_path, notice: 'Invalid news'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @news }
      end
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    begin
    @news = News.find(params[:id])
    rescue  ActiveRecord::RecordNotFound
      logger.error "Attempt to edit invalid news #{params[:id]}"
      redirect_to news_path, notice: 'Invalid news'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @news }
      end
    end
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(params[:news])
    
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end
end
