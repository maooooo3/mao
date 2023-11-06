class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def new
        @pet= Pet.new
      end
      def index
        if params[:search] == nil
          @pets= Pet.all
        elsif params[:search] == ''
          @pets= Pet.all
        else
          #部分検索
          @pets = Pet.where("genre LIKE ? ",'%' + params[:search] + '%')
        end 
        
     end
      def create
        pet = Pet.new(pet_params)
        pet.user_id = current_user.id
        if pet.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @pet = Pet.find(params[:id])
        @comments = @pet.comments
        @comment = Comment.new
    end
    
      private
      def pet_params
        params.require(:pet).permit(:name, :genre, :kind, :age, :detail, :image)
      end

end

