module ApplicationHelper
  def team_invite_url(token)
    "#{root_url}teams/join/#{token}"
  end
end
