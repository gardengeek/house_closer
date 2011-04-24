class LeadsController < ApplicationController
  before_filter :lead_cookie_or_auth, :except => [:new, :create]
  load_and_authorize_resource :except => [:new, :create]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :new
  end

  # GET /leads
  # GET /leads.xml
  def index
    @leads = @leads.find(:all, :include => [:contact, :agent])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leads }
    end
  end

  # GET /leads/1
  # GET /leads/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lead }
    end
  end

  # GET /leads/new
  # GET /leads/new.xml
  def new
    @lead = Lead.new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lead }
    end
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.xml
  def create
    @lead = Lead.new(params[:lead])

    Lead.transaction do
      if !@lead.contact
        @lead.contact = Contact.create(params[:contact])
      end
      @contact = @lead.contact
      respond_to do |format|
        if @lead.save
          session[:lead_id] = @lead.id
          format.html { redirect_to(@lead, :notice => 'Lead was successfully created.') }
          format.xml  { render :xml => @lead, :status => :created, :location => @lead }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @lead.errors, :status => :unprocessable_entity }
        end
      end
      raise ActiveRecord::Rollback if @lead.new_record? || @lead.contact.new_record?
    end
  end

  # PUT /leads/1
  # PUT /leads/1.xml
  def update
    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to(@lead, :notice => 'Lead was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lead.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.xml
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to(leads_url) }
      format.xml  { head :ok }
    end
  end

  private

  def lead_cookie_or_auth
    (Ability.lead_id = session[:lead_id]) || authenticate
  end
end
