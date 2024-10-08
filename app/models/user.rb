require 'pry'
class User < ActiveRecord::Base
  has_many :teams, dependent: :destroy
  has_many :champions, dependent: :destroy
  has_many :memberships
  has_many :teams, through: :memberships
  has_secure_password
  has_one_attached :image

  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_save { self.email = email.downcase }

  validate do |user|
      user.errors.add(:base, "Nome não pode ficar em branco") if user.name.blank?
      user.errors.add(:base, "Nome deve ter no máximo 50 caracteres") if user.name.length > 50

      if user.new_record?
      user.errors.add(:base, "A senha deve ter pelo menos 8 caracteres")  unless user.password.present? && user.password.length >= 8
      user.errors.add(:base, "Email não pode ficar em branco") if user.email.blank?
      user.errors.add(:base, "Email inválido") unless user.email.match?(VALID_EMAIL_FORMAT)
      user.errors.add(:base, "Email deve ter no máximo 260 caracteres") if user.email.length > 260
      user.errors.add(:base, "Email já está em uso") if User.exists?(email: user.email.downcase)
    end
  end
end
