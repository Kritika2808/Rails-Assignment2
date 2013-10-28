class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
	@requests = Request.all
        @detail=Detail.new

=begin
@requests = Request.paginate(:page => params[:page], :order => 'created_at desc', :per_page => 2)
=end
	render :layout=>'ajax'
  end
  def neww
	@book = Book.new
	@request = Request.new
	@book.id = params[:book_id].to_i
	@request.book_id = @book.id
	@request.request_status="Pending"
	@request.user_id=current_user.id









=begin
	@request = Request.new
	@request.book = params[:book_id]
	@request.user= current_user.id
	render text: book_id.inspect
	render text: userId.inspect
	#@request.request_status="Pending"
=end
  end	
  # GET /requests/1
  # GET /requests/1.json
  def show
	
  end

  # GET /requests/new
  def new
    @request = Request.new
	
	
  end

  # GET /requests/1/edit
  def edit
	
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
  

    respond_to do |format|
      if @request.update(request_params)
         bookid=@request.book_id
		@book=Book.find(bookid)
                if @request.request_status=="Approved"
                    @book.user_id=@request.user_id
		    
                    @book.status="Issued"
                        @book.save
		    @detail=Detail.find(@book.user_id)
			@detail.noofbooksissued=@detail.noofbooksissued+1
				@detail.save                        
                               
		end

        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
                        
                  
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:request_status, :user_id, :book_id)
    end
end
