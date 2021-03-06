class Expert < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :reserve
  has_many :reservable_frame
  belongs_to :expert_type

  mount_uploader :user_image, UserImageUploader

  def get_image_path
    user_image.presence || "/no_avater.png"
  end

  attribute :expert_type_id, :integer, default: 1

end
