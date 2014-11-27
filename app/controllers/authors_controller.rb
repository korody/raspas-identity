class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @author.update(author_params)
      redirect_to @author, success: "Pensador atualizado com sucesso."
    else
      render 'edit'
    end
  end
  
private

  def find_author
    @author = Author.find_by_username!(params[:id].split("/").last)
  end
  
  def author_params
    params.require(:author).permit(:name, :username, :slug, :bio, :dob, :dod, :website)
  end
end