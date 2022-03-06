class Public::MusclePostsController < ApplicationController
   before_action :authenticate_customer!
   
   def create
       @muscle_post = MusclePost.new(muscle_post_params)
   end
   
   private
    def muscle_post_params
        params.require(:muscle_post).permit(:muscle_menu_id)
    end
   
end
