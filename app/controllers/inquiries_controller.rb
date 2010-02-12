class InquiriesController < ApplicationController
  has_rakismet
  before_filter :permission, :except => [:new,:create]
  
  # GET /inquiries
  # GET /inquiries.xml
  def index
    @inquiries = Inquiry.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inquiries }
    end
  end

  # GET /inquiries/1
  # GET /inquiries/1.xml
  def show
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inquiry }
    end
  end

  # GET /inquiries/new
  # GET /inquiries/new.xml
  def new
    @inquiry = Inquiry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inquiry }
    end
  end

  # GET /inquiries/1/edit
  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  # POST /inquiries
  # POST /inquiries.xml
  def create
    @inquiry = Inquiry.new(params[:inquiry])
    @inquiry.request = request
    @inquiry.is_spam = @inquiry.spam?

    respond_to do |format|
      if @inquiry.save
        email = InquiryMailer.deliver_inquiry(@inquiry)
        @inquiry = Inquiry.new
        flash[:notice] = 'Inquiry was successfully created.'
        format.js 
        format.html { redirect_to(new_inquiry_path) }
        format.xml  { render :xml => @inquiry, :status => :created, :location => @inquiry }
      else
        format.js { render :partial => "common/xhr_flash" }
        format.html { render :action => "new" }
        format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inquiries/1
  # PUT /inquiries/1.xml
  def update
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      if @inquiry.update_attributes(params[:inquiry])
        flash[:notice] = 'Inquiry was successfully updated.'
        format.html { redirect_to(@inquiry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.xml
  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    respond_to do |format|
      format.html { redirect_to(inquiries_url) }
      format.xml  { head :ok }
    end
  end
end
