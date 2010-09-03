class EventsController < ApplicationController
 before_filter :login_required, :only=>[:comment]
  # before_filter :require_user, :only=>[:new,:edit,:create,:update,:destroy]
 #:login_required

  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
#session[:event]=@event
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

 
 
   def comment

      @event = Event.find(params[:format])
      comment = Comment.new(params[:comment])
      @event.add_comment comment
      comment.save!

      #Commentmailer.deliver_comment(comment)
      flash[:notice] = "Comentario añadido con éxito"
      redirect_to :action => 'show', :id=>@event.id
  end


end
