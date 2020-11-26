class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.where(user_id: current_user.id).order("#{sort} #{direction}")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def sort
    params[:sort] || 'first_name'
  end

  def direction
    params[:direction] || 'asc'
  end
end