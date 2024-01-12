
describe 'Usuário avalia uma receita' do
  it 'a partir da home' do
    owner = create(:user)
    user = create(:user)
    recipe = create(:recipe, title: 'Brigadeiro', user: owner)

    login_as user

    visit root_path
    click_on 'Brigadeiro'

    click_on 'Deixe sua avaliação'

    expect(current_path).to eq new_recipe_review_path recipe
    expect(page).to have_field 'Comentário'
    expect(page).to have_field 'Nota'
    expect(page).to have_button 'Enviar Avaliação'
  end

  it 'com sucesso' do
    owner = create(:user)
    user = create(:user)
    recipe = create(:recipe, title: 'Brigadeiro', user: owner)

    login_as user

    visit root_path
    click_on 'Brigadeiro'

    click_on 'Deixe sua avaliação'

    fill_in 'Comentário', with: 'Receita muito boa, nota 10'
    fill_in 'Nota', with: 5
    click_on 'Enviar Avaliação'

    expect(current_path).to eq recipe_path(recipe)
    expect(page).to have_content 'Avaliação enviada com sucesso!'
    expect(page).to have_content 'Avaliações'
    expect(page).to have_content "Usuário: #{user.email}"
    expect(page).to have_content 'Comentário: Receita muito boa, nota 10'
    expect(page).to have_content 'Nota: 5/5'
    expect(page).not_to have_link 'Deixe sua Avaliação'
  end

  it 'com falhas' do
    owner = create(:user)
    user = create(:user)
    recipe = create(:recipe, title: 'Brigadeiro', user: owner)

    login_as user

    visit root_path
    click_on 'Brigadeiro'

    click_on 'Deixe sua avaliação'

    fill_in 'Comentário', with: ''
    fill_in 'Nota', with: '7'
    click_on 'Enviar Avaliação'

    expect(page).not_to have_content 'Avaliação enviada com sucesso!'
    expect(page).to have_content 'Erro ao enviar avaliação!'
    expect(page).to have_content 'Comentário não pode ficar em branco'
    expect(page).to have_content 'Nota deve ser menor ou igual a 5'
  end
end
