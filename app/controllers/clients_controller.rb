class ClientsController < ApplicationController
  layout :http_or_xhr
  before_filter :permission, :except => :index
  
  # GET /clients
  # GET /clients.xml
  def index
    @featured_clients = Client.find_all_by_is_featured(true, :order => :featured_position)
    @clients = Client.find(:all, :order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new
    @imagefile = Imagefile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])
    if params[:imagefile][:uploaded_data].size > 0
      @client.create_imagefile(params[:imagefile])
    end

    respond_to do |format|
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        format.html { redirect_to(clients_url) }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])
    if params[:imagefile][:uploaded_data].size > 0
      @client.imagefile.destroy if @client.imagefile
      @client.create_imagefile(params[:imagefile])
    end

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(clients_url ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
  
  def order
    params[:client_list].each_with_index do |id, position|
     Client.update(id, {:position => position+1})
    end
    render :text => params.inspect
  end
  
  def order_featured
    params[:featured_clients].each_with_index do |id, position|
     Client.update(id, {:featured_position => position+1})
    end
    render :text => params.inspect
  end

  def inspect_params
    render :text => params.inspect
  end

end
