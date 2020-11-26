class Contact < ApplicationRecord
  has_one_attached :avatar
  has_many :metrics
  belongs_to :user

  validates_presence_of :first_name, :last_name
  validates :email, format: { with: Devise.email_regexp }, if: :email
  validate :avatar_type_and_size, if: -> { avatar.attached? }

  private
  def avatar_type_and_size
    unless avatar.content_type.in?(['image/png', 'image/jpg', 'image/jpeg'])
      errors.add(:avatar, "Must be of type png, jpg or jpeg")
    end

    unless avatar.byte_size < 500000
      errors.add(:avatar, "Must be of size below 500kb")
    end
  end
end
