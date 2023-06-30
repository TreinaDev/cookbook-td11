require 'rails_helper'

feature 'Admin registra tipo de receita' do
  scenario 'com sucesso' do
    admin = create(:user, email: 'admin@email.com',
                          password: '123456', role: :admin)

    login_as admin, scope: :user
    visit new_recipe_type_path
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Salvar'

    expect(current_path).to eq recipe_types_path
    expect(page).to have_content('Sobremesa')
    expect(page).to have_content('Tipo de receita cadastrada com sucesso')
  end

  scenario 'precisa preencher todos os campos' do
    admin = create(:user, email: 'admin@email.com',
                          password: '123456', role: :admin)

    login_as admin, scope: :user
    visit new_recipe_type_path
    fill_in 'Nome', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Não foi possível cadastrar tipo de receita')
    expect(RecipeType.count).to eq 0
  end

  scenario 'precisa ser admin' do
    user = create(:user, email: 'user@email.com',
                         password: '123456', role: :user)

    login_as user, scope: :user
    visit new_recipe_type_path

    expect(current_path).to eq root_path
  end

  scenario 'precisa estar logado' do
    visit new_recipe_type_path

    expect(current_path).to eq new_user_session_path
  end
end
