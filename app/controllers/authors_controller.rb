class AuthorsController < ApplicationController
  respond_to :html, :json
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @author.update_attributes(author_params)
    respond_with_bip @author
  end
  
private

  def find_author
    @author = Author.find_by_username!(params[:id].split("/").last)
  end
  
  def author_params
    params.require(:author).permit(:name, :username, :slug, :bio, :dob, :dod, :website)
  end
end