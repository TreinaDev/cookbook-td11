FactoryBot.define do
  factory :recipe do
    user
    title { 'Brigadeiro' }
    cook_time { 30 }
    recipe_type
    ingredients { 'Leite condensado, chocolate em pó e manteiga' }
    instructions { 'Misture tudo, leve ao fogo e mexa até começar a soltar da panela. Desligue e espere esfriar.' }
  end
end
