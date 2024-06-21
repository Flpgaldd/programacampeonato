class Champion < ActiveRecord::Base
  belongs_to :user

  validate :validate_presence_of_fields
  validate :validate_year
  validate :validate_end_date_after_start_date

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private


  # Validate presence of required fields
  def validate_presence_of_fields
    errors.add(:base, "Nome é obrigatório") if name.blank?
    errors.add(:base, "Data de início é obrigatória") if start_date.blank?
    errors.add(:base, "Data de término é obrigatória") if end_date.blank?
    errors.add(:base, "O local de partida é obrigatório") if game_type.blank?
    errors.add(:base, "Tipo de visão é obrigatório") if vision.blank?
    errors.add(:base, "Tipo de partida é obrigatório") if team.blank?
    errors.add(:base, "Tipo de pontuação é obrigatório") if pontuation.blank?
  end

  # Validate that the year of the dates is either the current year or the next years
  def validate_year
    current_year = Date.current.year
    limit_year = current_year + 5 # Change 5 to the number of years after the current year that are valid
    if start_date.present? && (start_date.year < current_year || start_date.year > limit_year)
      errors.add(:base, "A data está inválida! O ano tem que ser o atual ou nos próximos #{limit_year - current_year} anos.")
    end
    if end_date.present? && (end_date.year < current_year || end_date.year > limit_year)
      errors.add(:base, "A data está inválida! O ano tem que ser o atual ou nos próximos #{limit_year - current_year} anos.")
    end
  end

  # Validate that end date is after start date
  def validate_end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:base, "A data de término deve ser posterior à data de início")
    end
  end
end
