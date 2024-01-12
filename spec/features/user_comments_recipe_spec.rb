require 'rails_helper'

feature 'Usuário comenta receita' do
  scenario 'com sucesso' do
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Lanche')
    recipe = create(:recipe, user: user)

    login_as user, scope: :user
    visit root_path
    click_on recipe.title
    click_on 'Comentar'
    fill_in 'Comentário', with: 'Gostei'
    click_on 'Enviar'

    expect(page).to have_content 'Comentário enviado com sucesso'
    expect(page).to have_current_path(recipe_path(recipe))
    expect(page).to have_content 'Comentários'
    expect(page).to have_content 'Gostei'
  end

  scenario 'e precisa estar logado' do
    recipe = create(:recipe)

    visit recipe_path(recipe)
    click_on 'Comentar'

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'e não pode ser comentário vazio' do
    user = create(:user)
    recipe = create(:recipe)

    login_as user, scope: :user
    visit recipe_path(recipe)
    click_on 'Comentar'
    fill_in 'Comentário', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Comentário não pode ficar em branco'
    expect(recipe.comments.count).to eq 0
  end
end
