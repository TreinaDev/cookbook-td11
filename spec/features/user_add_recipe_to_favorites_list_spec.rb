require 'rails_helper'

describe 'Usuario salva receita na lista de favoritos' do
  it 'com sucesso' do
    first_user = create(:user, email: 'first_user@email.com', password: '123456', role: :user)
    second_user = create(:user, email: 'second_user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Lanche')
    recipe = create(:recipe, user: first_user)

    login_as second_user
    visit recipe_path(recipe)
    click_on "Favoritar"

    expect(page).to have_content "Receita adicionada aos favoritos!"
    expect(FavoriteRecipes.last).to eq recipe
  end
  
end
