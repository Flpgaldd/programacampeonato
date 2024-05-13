require 'rails_helper'
require 'pry'
RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
    it "login success" do
      user=User.new(name:"Felipe",middle_name: "Galdino",email:"felipegald@gmail.com",password:"12345678")
      user.save
      user_params = {
        session: {
          email: user.email,
          password: user.password
    }
      }
      post "/sign_in", params: user_params

      expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(home_path)

    end


  end

    describe "Sign in", type: :feature do
      it "displays error message for invalid login" do
        user = User.create(name: "Felipe", middle_name: "Galdino", email: "felipegald@gmail.com", password: "12345678")

        visit login_path
        fill_in "session[email]", with: user.email
        fill_in "session[password]", with: "invalidpassword"
        click_button "commit"

        expect(page).to have_content("Suas credencias estão invalidas!")
      end
    end

end
