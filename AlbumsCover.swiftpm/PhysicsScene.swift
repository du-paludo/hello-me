import SpriteKit

// Essa é a cena interativa que é exibida
class PhysicsScene: SKScene, SKPhysicsContactDelegate {

    // Essa parte do código é executada logo que a cena começa
    override func didMove(to view: SKView) {

        // Aproveitamos esse momento para criar paredes para que os objetos não escapem da cena
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        // Define a parede criada como corpo físico da cena
        self.physicsBody = borderBody
    }

    // Função que recebe a coordenada do ponto clicado na tela
    func touchDown(atPoint pos : CGPoint) {
        // Cada vez que ocorre um click na tela, chamamos a função para adicionar um novo álbum na cena.
        newAlbum(position: pos)
    }

    // Função chamada para criar um novo álbum na cena
    func newAlbum(position: CGPoint) {

        // Vamos começar sorteando um dos 26 álbuns
        let sort = Int.random(in: 1...26)

        // Então vamos transformar o número em string (texto) para coincidir com o nome dos álbuns que importamos no projeto

        let albumName = String(sort)

        // Vamos criar um SPRITE com a imagem do álbum sorteado
        // Pense nos sprites como imagens mais poderosas. Podemos alterar cor, forma, posição e muitos outros atributos. Além disso, os sprites podem possuir corpos físicos, o que permite que eles sejam afetados pela "gravidades", colidam e interajam com outros elementos
        let album = SKSpriteNode(imageNamed: albumName)

        // Ajustando a escala do álbum
        album.setScale(0.6)

        // Vamos posicionar o sprite na posição clicada na tela. A posição foi recebida pela função newAlbum
        album.position = position

        // Adicionando física ao álbum. Para que ele possa cair e colidir com os demais álbuns na tela

        // Vamos criar o corpo físico com tamanho igual ao da imagem do álbum
        let body = SKPhysicsBody(rectangleOf: album.size)

        // Vamos ligar a gravidade do corpo físico
        body.affectedByGravity = true

        // Agora vamos atribuir o corpo físico ao álbum
        album.physicsBody = body

        // E finalmente o novo álbum é adicionado na cena
        self.addChild(album)

        // Aplicando um impulso aleatório para o álbum ser arremessado quando criado
        body.applyImpulse(CGVector(dx: CGFloat.random(in: -300...300), dy: CGFloat.random(in: 20...300)))
    }



    // Essa parte cuida de monitorar os toques ou cliques na tela. Cada vez que isso acontece essa função chama a nossa outra função touchDown passando a posição exata do toque na tela. Normalmente não precisamos mexer aqui.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
}
