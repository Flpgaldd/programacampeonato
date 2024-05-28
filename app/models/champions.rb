class Champions < ApplicationRecord

    validate do |champions|
    champions.errors.add(:base, "Nome não pode ficar em branco") if champions.name.blank?
    champions.errors.add(:base, "Data de início não pode ficar em branco") if champions.start_date.blank?
    champions.errors.add(:base, "Data de término não pode ficar em branco")  if champions.end_date.blank?

  end
end
