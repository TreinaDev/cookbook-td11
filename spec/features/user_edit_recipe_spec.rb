require 'rails_helper'

feature 'Usuário edita receita' do
  scenario 'com sucesso' do
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Lanche')
    recipe = create(:recipe, user: user)

    login_as user, scope: :user
    visit edit_recipe_path(recipe)
    fill_in 'Título', with: 'Hamburguer'
    select 'Lanche', from: 'Tipo de receita'
    fill_in 'Tempo de preparo', with: 10
    fill_in 'Ingredientes', with: 'hamburguer, pão de hambuerguer, queijo'
    fill_in 'Forma de preparo', with: 'Frite o hamburguer, coloque no pão, coma'
    click_on 'Atualizar Receita'

    expect(page).to have_content 'Criado por: user@email.com'
    expect(page).to have_content 'Hamburguer'
    expect(page).to have_content 'Lanche'
    expect(page).to have_content '10 minutos'
    expect(page).to have_content 'hamburguer, pão de hambuerguer, queijo'
    expect(page).to have_content 'Frite o hamburguer, coloque no pão, coma'
  end

  scenario 'precisa estar logado' do
    recipe = create(:recipe)

    visit edit_recipe_path(recipe)

    expect(current_path).to eq new_user_session_path
  end
end
