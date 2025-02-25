import 'dart:io';

void main (){
  List<String> notas = <String>[];
  menu(notas);
}

String getComando(){ //Essa função deve devolver o comando digitado
  print("Digite um comando: 1 - Adicionar nota, 2 - Listar notas,  3 - Sair"); 
  List<String> comandos = <String>["1", "2", "3"];
  String? entrada = "";

  entrada = stdin.readLineSync(); //capturando a entrada do usuário

  if (entrada == null || !comandos.contains(entrada)) {//! na frente => Dizendo que algo é um booleando ao contrário, invertido, falso por ex. Nesse caso, não percente.
    print("Comando inválido");
    getComando();
  }
  return entrada!;
}

List<String> adicionaNota(List<String> notas) { //Essa função deve devolver uma nova nota
  print("Escreva uma nota");
  String? nota = "";

  nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty){//isEmpty => O conteúdo textual dessa nota é vazio?
    print("Não é possível adicionar uma nota vazia");
    adicionaNota(notas);
  }

  notas.add(nota!); //Adicionando uma nota na lista de notas

  return notas;
}

void listarNotas(List<String> notas){ //Nessa função vai ser somente para mostrar a lista de notas, recebendo como parâmetro as notas
  for (var i = 0; i < notas.length; i++){ //Para percorrer a lista vou utilizar o for (laço de repetição) | Listas começam na posição 0, iniciar contador assim. A condição deve ser que i deve ser menor que o tamanho da lista
    print(notas[i]); //imprimir a nota na posição em que o i está
  }
}

void menu(List<String> notas){//Vai chamar as funções e sair do app
  print("");
  cabecalho();
  print(""); //Espaço no terminal
  String comando = getComando();
  print("");

  switch (comando){
    case "1":
    adicionaNota(notas);
    menu(notas);

    case "2":
    listarNotas(notas);
    menu(notas);

    case "3":
    print("Até breve!");
  }
} 

void cabecalho() {
  print("  _    _       _            ");
  print(" | \\ | | ___ | |_ __ _ ___ ");
  print(" |  \\| |/ _ \\| __/ _` / __|");
  print(" | |\\  | (_) | || (_| \\__ \\");
  print(" |_| \\_|\\___/ \\__\\__,_|___/");
  print("                           ");
}
