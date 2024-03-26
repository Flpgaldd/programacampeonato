require "rails_helper"

RSpec.describe "Home" , type: :request do
  it "render page intial" do
    get root_path
    expect(response).to have_http_status(200)
    expect(response.body).to include("Bem vindo a nossa pagina inicial")
  end
end
