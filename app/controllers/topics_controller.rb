class TopicsController < ApplicationController
 # #7
   before_action :require_sign_in, except: [:index, :show]
 # #8
   before_action :authorize_user, except: [:index, :show]
 ...

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
