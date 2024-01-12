require 'rails_helper'

describe 'Usuário vê receitas que favoritou' do
  it 'a partir da página inicial' do
    user = create(:user)
    recipe = create(:recipe, title: 'Brigadeiro')
    recipe_1 = create(:recipe, title: 'Beijinho')
    recipe_2 = create(:recipe, title: 'Pudim de Leite')
    create(:favorite_recipe, user: user, recipe: recipe)
    create(:favorite_recipe, user: user, recipe: recipe_1)

    login_as user
    visit root_path
    click_on 'Receitas Favoritas'

    expect(page).to have_content 'Brigadeiro'
    expect(page).to have_content 'Beijinho'
    expect(page).not_to have_content 'Pudim de Leite'
  end

  it 'e não encontra receitas favoritadas' do
    user = create(:user)
    user_2 = create(:user)
    recipe = create(:recipe, title: 'Brigadeiro')
    recipe_1 = create(:recipe, title: 'Beijinho')
    create(:favorite_recipe, user: user, recipe: recipe)
    create(:favorite_recipe, user: user, recipe: recipe_1)

    login_as user_2
    visit root_path
    click_on 'Receitas Favoritas'

    expect(page).to have_content 'Nenhuma Receita Favoritada'
    expect(page).not_to have_content 'Brigadeiro'
    expect(page).not_to have_content 'Beijinho'
    expect(page).not_to have_content 'Pudim de Leite'
  end
end
