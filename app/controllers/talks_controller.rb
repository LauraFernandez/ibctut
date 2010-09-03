class TalksController < ApplicationController
  before_filter :login_required, :only=>[:comment]
  before_filter :get_event,:only=>[:show,:create]

  def get_event
    @event=Event.find(params[:event_id]) unless params[:event_id].nil?
  end
  # GET /talks
  # GET /talks.xml
  def index
    @talks = Talk.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
    end
  end

  # GET /talks/1
  # GET /talks/1.xml
  def show
    @talk = Talk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @talk }
    end
  end

 
  def comment

    @talk = Talk.find(params[:format])
    comment = Comment.new(params[:comment])
    @talk.add_comment comment
    comment.save!

    #Commentmailer.deliver_comment(comment)
    flash[:notice] = "Comentario añadido con éxito"
    redirect_to :action => 'show', :id=>@talk.id
  end
end
