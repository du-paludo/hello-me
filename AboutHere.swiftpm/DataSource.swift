import Foundation

class DataSource {
    func getData() -> [CardModel] {
        return Self.data
    }
    
    // Local onde se encontram os dados que são apresentados no aplicativo. Cada CardModel corresponde a um Card na tela inicial do app.
    private static let data = [
        CardModel(imageName: "elevador", title: "Mentores", text: "Essa é a foto do primeiro dia de trabalho da mentoria, ela foi tirada 3 semanas depois do primeiro de trabalho da mentoria."),
        CardModel(imageName: "elevador", title: "Elevador", text: "Esse é o nosso elevador! A forma mais demorada de chegar ao segundo andar… Ele é livre para uso e uma forma de garantir que todes possam usufruir do espaço da Academy com autonomia. Ele foi peça importantíssima na Missão do Monolito."),
        CardModel (imageName: "microondas", title: "Microondas", text: "Temos um microondas exclusivo e muito tecnológico que permite esquentar comidas, água para o chá, comidas, água, salgados, mas nada de pipoca!!!!"),
        CardModel (imageName: "sofazinho", title: "Sofázinhos", text: "Os sofázinhos são patrimônio tombado e são considerados uma das 7 maravilhas da Academy. Dentre suas várias funções, eles são muito conhecidos por acolher estudantes (cansados ou não) que chegam antes do horário."),
        CardModel(imageName: "pia", title: "Pia", text: "Essa pia enorme, linda, limpa e seca, é o local onde serão abrigadas as mais diversas e variadas canecas. Gostamos de ver ela limpa e vazia. Abra as torneiras com cuidado para não se molhar."),
        CardModel(imageName: "bicicletario", title: "Bicicletário", text: "Olá ciclistas! Embaixo da nossa escada é possível deixar sua bicicleta guardada em segurança. Esse lugar incrível destinado as bicicletas, um dia já acolheu bebês e por isso é muito especial para todos que compõem a mentoria jr. Também, nos dias de chuvas é preciso saber dividir, pois esse espaço é ideal para guarda-chuvas e sombrinhas molhadas."),
        CardModel (imageName: "mesas", title: "Mesas que sobem e descem", text: "Essas são as mesas da Academy. Elas são incríveis por que permitem que você suba e desça e fique sempre confortável! A altura da mesa escolhida pode contar muito sobre quantas horas alguém passou programando ou criando componentes no figma. Cuidado com os monitores!"),
        CardModel (imageName: "alarme", title: "Alarme de incêndio", text: "Esse é o alarme de incêndio, item de segurança encarregado de nos avisar caso aconteça algum incêndio. Em 2024, durante um treinamento tivemos o prazer de ouvi-lo por cerca de 1 hora ininterruptas, e testemunhas garantem que ele é capaz de alcançar agudos mais altos que a Ariana Grande. "),
        CardModel(imageName: "monolito", title: "Monolito", text: "Esse é o nosso monolito multiuso, ele serve para transmitir telas por meio da Apple Tv, ou para escrever nele com as canetas de giz líquido, ou os dois se quiser. Em 2023, foi necessário fazer a Missão do Monolito, em que uma turma inteira e mentores se reuniram para deslocar ele do primeiro ao segundo andar, foram necessárias em torno de 30 pessoas, 3 pessoas que colocaram a mão na massa, e 27 que contribuíram com suas energias positivas.")
    ]
}
