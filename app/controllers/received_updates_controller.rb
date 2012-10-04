class ReceivedUpdatesController < ApplicationController
  # GET /received_updates
  # GET /received_updates.json

  def index
    @application = Application.find(params[:application_id]) rescue nil
    name = params[:app_name] || params[:application_id]
    @application = Application.find_by_name(name) if @application.blank?
    since = Time.parse(params[:since]).utc rescue nil
    agency_id = params[:agency_id] || ( params[:search][:agency_id] unless params[:search].blank? )

    condition = agency_id.blank? ? "1=1" : "agency_id='#{agency_id}'"
    
    unless params[:search].blank? 
      condition += " and name='#{params[:search][:type]}'" unless params[:search][:type].blank? || params[:search][:type] == "Any"
      condition += " and obj_id='#{params[:search][:object_id]}'" unless params[:search][:object_id].blank? 
    end
    
    @received_updates = @application.received_updates.where(condition).since( since ).order("created_at desc")
    
    @update_types = ["agency.update", "agent.create", "agent.update", "attendances.create", "attendances.delete",
       "contact.create", "contact.delete", "contact.update", "floorplans.update", "inspections.create", "inspections.update",
        "listing.create", "listing.update", "photos.update", "questions.update", "subscriptions.update", "virtual_realities.update"].collect{ |x| [x,x] }
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @received_updates }
    end
  end

  # GET /received_updates/1
  # GET /received_updates/1.json
  def show
    @received_update = ReceivedUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @received_update }
    end
  end

  # GET /received_updates/new
  # GET /received_updates/new.json
  def new
    @application = Application.find(params[:application_id])
    @received_update = @application.received_updates.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @received_update }
    end
  end

  # GET /received_updates/1/edit
  def edit
    @received_update = ReceivedUpdate.find(params[:id])
  end

  # POST /received_updates
  # POST /received_updates.json
  def create
    #@received_update = ReceivedUpdate.new(params[:received_update])
    @application = Application.find(params[:application_id])
    @received_update = @application.received_updates.new(params[:received_update])

    respond_to do |format|
      if @received_update.save
        format.html { redirect_to application_received_updates_path(@received_update.application), notice: 'Received update was successfully created.' }
        format.json { render json: @received_update, status: :created, location: @received_update }
      else
        format.html { render action: "new" }
        format.json { render json: @received_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /received_updates/1
  # PUT /received_updates/1.json
  def update
    @received_update = ReceivedUpdate.find(params[:id])

    respond_to do |format|
      if @received_update.update_attributes(params[:received_update])
        format.html { redirect_to @received_update, notice: 'Received update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @received_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /received_updates/1
  # DELETE /received_updates/1.json
  def destroy
    @received_update = ReceivedUpdate.find(params[:id])
    @received_update.destroy

    respond_to do |format|
      format.html { redirect_to received_updates_url }
      format.json { head :no_content }
    end
  end
end
