class Team < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  validate :validate_presence_of_fields

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp", "image/tiff"], message: "deve ser um arquivo JPG, JPEG, PNG, GIF, BMP ou TIFF." }

    private

    def validate_presence_of_fields
      errors.add(:base, "Nome é obrigatório") if name.blank?
      errors.add(:base, "Descrição é obrigatório") if description.blank?
    end
end
