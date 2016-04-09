class TopicsController < ApplicationController

  def index
  @topics = Topic.all
  end

  def show
     @topic = Topic.find(params[:id])
   end

   def create
     @topic = Topic.new(topic_params)

     if @topic.save
 # #20
       @topic.labels = Label.update_labels(params[:topic][:labels])
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end


  def update
     @topic = Topic.find(params[:id])

     @topic.assign_attributes(topic_params)

     if @topic.save
 # #21
       @topic.labels = Label.update_labels(params[:topic][:labels])
       flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
   end
 # #7
   before_action :require_sign_in, except: [:index, :show]
 # #8
   before_action :authorize_user, except: [:index, :show]

   private
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end

 # #9
   def authorize_user
     unless current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to topics_path
     end
   end
end
