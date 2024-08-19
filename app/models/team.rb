class Team < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :users, through: :memberships

  validate :validate_presence_of_fields

  has_one_attached :image
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
