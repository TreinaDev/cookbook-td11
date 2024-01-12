require 'rails_helper'

feature 'Usuário adiciona imagem ao comentário' do
  scenario 'com sucesso' do
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Lanche')
    recipe = create(:recipe, user: user)

    login_as user, scope: :user
    visit root_path
    click_on recipe.title
    click_on 'Comentar'
    fill_in 'Comentário', with: 'Gostei'
    attach_file('Imagem', 'spec/support/images/foto1.jpg')
    click_button 'Enviar'

    expect(page).to have_css("img[src*='.jpg']", count: 1)
  end
end
