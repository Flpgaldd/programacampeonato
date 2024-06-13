class Champions < ApplicationRecord

    validate do |champions|
    champions.errors.add(:base, "Nome é obrigatório") if champions.name.blank?
    champions.errors.add(:base, "Data de início não é obrigatório") if champions.start_date.blank?
    champions.errors.add(:base, "Data de término é obrigatório")  if champions.end_date.blank?
    champions.errors.add(:base, "O local de partida é obrigatório")  if champions.game_type.blank?
    champions.errors.add(:base, "Tipo de visão é obrigatório")  if champions.vision.blank?
    champions.errors.add(:base, "Tipo de partida é obrigatório")  if champions.team.blank?
  end
end
