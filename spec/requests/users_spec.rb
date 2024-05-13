require 'pry'


RSpec.describe "Users", type: :request do
  describe 'POST /register'  do
    it 'Um usuario deve ser criado!' do
      user_params = {
        user: {
          name: 'Felipe',
          middle_name: 'Galdino',
          email: 'feligal@gmail.com',
          password: '12345612312'
              }
          }

      post '/register', params: user_params
      user = User.last
      expect(response).to have_http_status(:redirect)
      expect(user.name).to eq('Felipe')
      expect(user.middle_name).to eq('Galdino')

    end
  end

    describe "register", type: :feature do
      it 'Um usuario deve ser criado!' do

        visit register_path
        fill_in 'user[name]', with: 'Felipe'
        fill_in 'user[middle_name]', with: 'Galdino'
        fill_in 'user[email]', with: 'feligal@gmail.com'
        fill_in 'user[password]', with: '12345612334'

        click_button 'commit'

        user = User.last

        expect(user.name).to eq('Felipe')
        expect(user.middle_name).to eq('Galdino')

      end
      it 'Mensagem de erro se não tiver as informações' do
        user_params = {
          user: {
            name: 'Felipe',
            middle_name: 'Galdino',
            email: 'feligal@gmail.com',
            password: '123456'
                }
            }

        visit register_path
      fill_in 'user[name]', with: ''
      fill_in 'user[middle_name]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''

      click_button 'commit'

      expect(page).to have_content("Email invalido")
      expect(page).to have_content("A senha não pode ficar em branco")
      expect(page).to have_content("A senha deve ter pelo menos 8 caracteres")
      expect(page).to have_content("Nome não pode ficar em branco")
    end
  end
end
