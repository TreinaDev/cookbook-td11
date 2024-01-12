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

  it 'e vê as últimas 5 receitas favoritadas na página inicial' do
    user = create(:user)
    recipe_1 = create(:recipe, title: 'Brigadeiro')
    recipe_2 = create(:recipe, title: 'Beijinho')
    recipe_3 = create(:recipe, title: 'Pudim de Leite')
    recipe_4 = create(:recipe, title: 'Sorvete')
    recipe_5 = create(:recipe, title: 'Hambúrguer')
    recipe_6 = create(:recipe, title: 'Cocada')

    create(:favorite_recipe, user: user, recipe: recipe_1)
    create(:favorite_recipe, user: user, recipe: recipe_2)
    create(:favorite_recipe, user: user, recipe: recipe_3)
    create(:favorite_recipe, user: user, recipe: recipe_4)
    create(:favorite_recipe, user: user, recipe: recipe_5)
    create(:favorite_recipe, user: user, recipe: recipe_6)

    login_as user
    visit root_path

    within '#favorite_recipes' do
      expect(page).to have_content 'Últimas Receitas Favoritadas'
      expect(page).not_to have_content 'Brigadeiro'
      expect(page).to have_content 'Beijinho'
      expect(page).to have_content 'Pudim de Leite'
      expect(page).to have_content 'Sorvete'
      expect(page).to have_content 'Hambúrguer'
      expect(page).to have_content 'Cocada'
    end
  end
end
