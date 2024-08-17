class Team < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :memberships
  has_many :users, through: :memberships

  validate :validate_presence_of_fields

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp", "image/tiff"], message: "deve ser um arquivo JPG, JPEG, PNG, GIF, BMP ou TIFF." }

  validates_attachment :image, content_type: {content_type: ["/\Aimage\/.*\z/"]}

    before_create :generate_invite_token

    private

    def validate_presence_of_fields
      errors.add(:base, "Nome é obrigatório") if name.blank?
      errors.add(:base, "Descrição é obrigatório") if description.blank?
    end

    def generate_invite_token
      self.invite_token = SecureRandom.hex(10) if invite_token.blank?
    end
end
