class ProjectsController < ApplicationController
  layout :http_or_xhr
  before_filter :permission, :except => [:list_by_category, :show, :show_first]
  before_filter :get_current_category
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
  def list_by_category
    @projects = Project.find_all_by_category(child.id)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    
    if params[:category_id]
      @category = Category.find(params[:category_id])
      session[:current_category] = @category.id
    else
      @category = @project.categories.first 
    end
    
    
    unless session[:current_category]
      session[:current_category] = @category.id
    else
      project_categories = @project.categories.collect{|cat| cat.id}
      unless project_categories.include? session[:current_category].to_i
        session[:current_category] = project_categories.first
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end
  
  # GET /projects/1
  # GET /projects/1.xml
  def show_first
    @category = Category.roots.first.children.first
    @project = @category.portfolio_menu_items.first.project
    
    unless session[:current_category]
      session[:current_category] = @category.id
    else
      project_categories = @project.categories.collect{|cat| cat.id}
      unless project_categories.include? session[:current_category].to_i
        session[:current_category] = project_categories.first
      end
    end

    respond_to do |format|
      format.html { render :template => "projects/show"} # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end
  
  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    if params[:imagefile][:uploaded_data].size > 0
      @project.create_imagefile(params[:imagefile])
    end
    @project.categories = Category.find(params[:categories]) if params[:categories]

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
    if params[:imagefile][:uploaded_data].size > 0
      @project.imagefile.destroy if @project.imagefile
      @project.create_imagefile(params[:imagefile])
    end
    @project.categories = Category.find(params[:categories]) if params[:categories]

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_current_category
    if session[:current_category]
      @current_category = Category.find(session[:current_category])
    else
      @current_category = Category.roots.first.children.first
    end
  end
end
