# Segmentacao

Esta aplicação cadastra contatos e os segmenta através de um formulário.
Utilize a opção "Novo Contato" para cadastrar novos Contatos. O Contato será apresentado na lista na parte inferior da tela. É possível visualizá-los, editá-los ou excluí-los através das opções "Detalhes", "Editar e "Excluir".
Utilizando a opção "Nova Segmentação" será cadastrada uma nova entrada no banco para a segmentação requerida com os dados informados.
Os dados tipo ("Igual a", "Contém", "Começa com" e "Termina com") nome e clausula ("E" ou "O") são utilizadas para as segmentações de Nome, E-mail e Cargo do Contato, enquanto igual, maior ou igual, maior, menos, menor igual e clausulas são utilizadas para as segmentações de Idade do Contato. Para estado é utilizado um select box simples com as opções disponíveis. 
Os resultados estarão disponíveis na lista de contatos abaixo do formulário, enquanto um histórico de segmentações estará na lista a direita do formulário.
É possível clicar em algum item do histórico de segmentações para segmentar os registros referentes a esta segmentação. Ao fazer isso o botão Editar Segmentação ficará disponível caso o usuário deseje alterar aquela segmentação sem cadastrar uma nova.
A lista, quando segmentada, estará sempre sendo atualizada automaticamente.

Foram utilizados:
- Ruby 2.3.1p112
- Gems:
  -bootstrap-sass: framwork visual para estilização da aplicação
  -jquery-turbolinks: facilita o uso do Turbolinks em relação aos bindings do jquery
  -pg: utilizar Postgresql no lugar do Sqlite nativo
  -guard: vigia mudanças nos arquivos
  -guard-livereload: recarrega a página no browser quando houver alguma mudança na aplicação
  -rspec-rails: realização de testes unitários
  -guard-rspec: roda os testes quando captar alterações nos mesmos 
- Banco de dados:
  Utilização do Sqlite para desenvolvimento e testes e Postgresql em produção. Rodar rake db:create para criar o banco,     rake db:migrate para rodar as migrations e rake db:seed para inserir as informações de Estado
- Heroku:
  Aplicação se encontra na url https://peaceful-river-17285.herokuapp.com/

