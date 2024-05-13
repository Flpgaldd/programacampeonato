class Champions < ApplicationRecord

  enum game_type: { squad: 0, duo: 1, solo: 2 }

end
