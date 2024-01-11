
require 'rails_helper'

describe 'Usuário favorita receita' do
  it 'a partir da home' do
    owner = create :user
    user = create :user
    first_recipe = create :recipe, user: owner
    second_recipe = create :recipe, user: owner, title: 'Beijinho'

    login_as user

    visit root_path

    click_on 'Favoritar Beijinho'

    expect(page).not_to have_content 'Favoritar Beijinho'
    expect(page).to have_content 'Receita [Beijinho] favoritada com sucesso'
  end
end
