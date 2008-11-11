class TabsController < ApplicationController
  layout :http_or_xhr
  before_filter :permission
  
  # GET /tabs
  # GET /tabs.xml
  def index
    @tabs = Tab.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tabs }
    end
  end

  # GET /tabs/1
  # GET /tabs/1.xml
  def show
    @tab = Tab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tab }
    end
  end

  # GET /tabs/new
  # GET /tabs/new.xml
  def new
    @tab = Tab.new
    @imagefile = Imagefile.new
    if params[:project_id]
      @tab.project = Project.find(params[:project_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tab }
    end
  end

  # GET /tabs/1/edit
  def edit
    @tab = Tab.find(params[:id])
  end

  # POST /tabs
  # POST /tabs.xml
  def create
    @tab = Tab.new(params[:tab])
    if params[:imagefile][:uploaded_data].size > 0
      @tab.create_imagefile(params[:imagefile])
    end
    if params[:project_id]
      @tab.project = Project.find(params[:project_id])
    else
      @tab.project = Project.find(params[:tab][:project_id])
    end

    respond_to do |format|
      if @tab.save
        flash[:notice] = 'Tab was successfully created.'
        format.html { redirect_to(project_path(Project.find(params[:tab][:project_id]))) }
        format.xml  { render :xml => @tab, :status => :created, :location => @tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tabs/1
  # PUT /tabs/1.xml
  def update
    @tab = Tab.find(params[:id])
    if params[:imagefile][:uploaded_data].size > 0
      @tab.imagefile.destroy if @tab.imagefile
      @tab.create_imagefile(params[:imagefile])
    end

    respond_to do |format|
      if @tab.update_attributes(params[:tab])
        flash[:notice] = 'Tab was successfully updated.'
        format.html { redirect_to(project_path(Project.find(params[:tab][:project_id]))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.xml
  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy

    respond_to do |format|
      format.html { redirect_to(tabs_url) }
      format.xml  { head :ok }
    end
  end
  
  def order
     params[:tab_list].each_with_index do |id, position|
       Tab.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
    render :text => params.inspect
   end
end
