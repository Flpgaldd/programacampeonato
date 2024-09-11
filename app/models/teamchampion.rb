class Teamchampion < ApplicationRecord
  belongs_to :team
  belongs_to :champion

  validate :validate_team_limit

  def validate_team_limit
    if champion.teams.size >= 16
      errors.add(:base, "Este campeonato já atingiu o limite de 16 times.")
    end
  end
end
