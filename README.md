**Documentação da API:**

"Treinei" é uma aplicação com a finalidade de registrar os treinos realizados por um usuário praticante de musculação e de entregar a ele a contagem de treinamentos finalizados em determinado período de tempo.

Rotas:
  
- POST ("/types")

  Deve receber um body no seguinte formato:
  
  {
  
      "trained_muscle_groups": (array de strings, contendo os grupos musculares trabalhados no treino),

      "exercises": (array de exercícios que deverão ser realizados no treino)
    
  }

  Como resposta da API, será dado um objeto que contém o ID do tipo de treino criado:
  
  {
  
      "id": 1
    
  }
  
- POST ("/trainings")

  Deve receber um body no seguinte formato:
  
  {
  
      "gym_name": (string com o nome de uma das academias cadastradas no banco de dados),

      "type_id": (ID do treino que foi iniciado)
    
  }

  Como resposta da API, será dado um objeto que contém o ID do treino iniciado:
  
  {
  
      "id": 1
    
  }

- PUT ("/trainings/:id")

  Deve receber o parâmetro ID do treino que será finalizado junto com um body no seguinte formato:
  
  {
  
      "did_all_the_exercises": (boolean para registrar se o usuário finalizou todos os exercícios indicados no tipo de treino)
    
  }

  Como resposta da API, será dado o status code 200.
  

- GET ("/trainings/:start/:end")

  Deve receber via params as datas de início e fim do período que se deseja buscar a contagem de treino, fornecidos no formato "YYYY-MM-DD":
  
  Exemplo: Para retornar a quantidade de treinos finalizados entre os dias 01 de novembro de 2022 e 30 de novembro de 2022, deve-se fazer a requisição GET para a rota "/trainings/2022-11-01/2022-11-30"

  A API poderá ter duas repostas:
  
  1. "There are no completed trainings";
  2. `${numéro de treinos finalizados} trainings were completed in this period`.
  
 Para todas as rotas existe a possibilidade de erro da aplicação, que deverá ter um status code 500 e uma resposta de um objeto de erro.
