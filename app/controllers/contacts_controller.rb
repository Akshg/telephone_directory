class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.where(user_id: current_user.id)
    @contacts = @contacts.where(
        "first_name ilike ? OR last_name ilike ? OR mobile ilike ? OR landline ilike ?",
        "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"
    ) if params[:q].present?
    @contacts = @contacts.order("#{sort} #{direction}")
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