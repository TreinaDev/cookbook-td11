require 'rails_helper'

feature 'Visitante vê receitas' do
  scenario 'na home com sucesso' do
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    create(:recipe, title: 'Manjar', cook_time: 60,
                    recipe_type:,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
    recipe_type = create(:recipe_type, name: 'Lanche')
    create(:recipe, title: 'Hamburguer', cook_time: 10,
                    recipe_type:,
                    ingredients: 'hamburguer, pão de hamburguer, queijo',
                    instructions: 'Frite o hamburguer, coloque no pão, coma')

    visit root_path

    expect(page).to have_content('Manjar')
    expect(page).to have_content('Sobremesa')
    expect(page).to have_content('60 minutos')
    expect(page).to have_content('Hamburguer')
    expect(page).to have_content('Lanche')
    expect(page).to have_content('10 minutos')
  end

  scenario 'e visualiza uma receita' do
    recipe_type = create(:recipe_type, name: 'Lanche')
    create(:recipe, title: 'Hamburguer', cook_time: 10,
                    recipe_type:,
                    ingredients: 'hamburguer, pão de hamburguer, queijo',
                    instructions: 'Frite o hamburguer, coloque no pão, coma')

    visit root_path
    click_on 'Hamburguer'

    expect(page).to have_content('Hamburguer')
    expect(page).to have_content('Lanche')
    expect(page).to have_content('10 minutos')
    expect(page).to have_content('hamburguer, pão de hamburguer, queijo')
    expect(page).to have_content('Frite o hamburguer, coloque no pão, coma')
  end

  scenario 'visuealiza receitas por tipo de receita' do
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    other_recipe_type = create(:recipe_type, name: 'Lanche')
    create(:recipe, title: 'Manjar', cook_time: 60,
                    recipe_type:,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
    create(:recipe, title: 'Hamburguer', cook_time: 10,
                    recipe_type: other_recipe_type,
                    ingredients: 'hamburguer, pão de hamburguer, queijo',
                    instructions: 'Frite o hamburguer, coloque no pão, coma')
    create(:recipe, title: 'HotDog', cook_time: 10,
                    recipe_type: other_recipe_type,
                    ingredients: 'salsicha, pão de hotdog, ketchup, mostarda',
                    instructions: 'Asse a salsicha, coloque no pão, coma')

    visit root_path
    click_on 'Lanche'

    expect(page).to have_content('Hamburguer')
    expect(page).to have_content('HotDog')
    expect(page).not_to have_content('Manjar')
  end
end
