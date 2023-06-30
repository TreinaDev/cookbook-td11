# CookBook

CookBook é uma aplicação em que usuários podem cadastrar suas receitas e
encontrar receitas criadas por outras pessoas. No seu estado atual, o projeto
conta apenas com algumas funcionalidades básicas:

- Administrador autenticado pode cadastrar tipos de receitas (Ex: “Sobremesa”,
“Prato principal);
- Visitantes podem visualizar receitas na página inicial e detalhes de uma receita;
- Usuários autenticados podem cadastrar receitas.

Esta aplicação faz parte das entrevistas técnicas do programa TreinaDev. Você receberá mais instruções da equipe da Campus Code, neste documento você vai encontrar instruções sobre como instalar e executar o projeto em seu computador.

## Instalação e Execução

### Pré Requisitos

Você vai precisar da versão `3.1.2` do Ruby e uma versão atual de NodeJS com Yarn instalado. Recomendamos sempre a instalação das versões LTS (Long Term Support).

### Passo a passo

1. Faça um [fork](https://docs.github.com/pt/get-started/quickstart/fork-a-repo#forking-a-repository) deste repositório em sua conta pessoal do Github.

2. Após a criação do novo repositório em sua conta, faça um  `git clone` da sua versão do CookBook para seu computador. 

3. Depois de clonar o repositório, acesse o diretório do projeto e rode os comandos:

```
bin/setup
```

Atente-se que o comando `bin/setup`vai executar o comando `yarn install`. 


4. Para popular a aplicação com alguns dados, execute:

```
rails db:seed
```


5. Esta aplicação possui dependências de CSS e JS isoladas do Gemfile. Por isso o processo de execução da app em `localhost` não deve ser feito somente com `rails server`. Para rodar a aplicação, rode o comando:

```
bin/dev
```

Para conhecer mais sobre este comando, leia seu código fonte na pasta `bin` do projeto e conheça mais sobre a gem [Foreman](https://github.com/ddollar/foreman)

6. Acesse `localhost:3000` em seu navegador de preferência e veja se está tudo ok.

7. Para rodar os testes, execute `rspec`.