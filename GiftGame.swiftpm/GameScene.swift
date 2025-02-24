import SpriteKit


// Aqui está a cena do jogo
class GameScene: SKScene, SKPhysicsContactDelegate {

    // Representação do personagem. Variável que guarda informações como imagem, animações e comportamento físico do personagem
    var player: SKSpriteNode!

    // Animações pra fazer o personagem andar e pular
    var walkAnimation: SKAction!
    var jumpAnimation: SKAction!

    // Estado do personagem. Útil para verificarmos se o personagem está caminhando ou pulando
    var playerStatus: PlayerStatus = .walking

    // Presentinho que aparece voando para o personagem pegar
    var gift: SKSpriteNode!

    // Essa parte do código é executada logo que a cena começa
    override func didMove(to view: SKView) {

        // Vamos começar adicionando um chão para a cena
        let ground = SKNode()

        // O chão precisa ter um corpo físico para que o personagem não passe através dele. Então vamos criar esse corpo físico
        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: 1346, height: 10))

        // Posicionamento do chão
        ground.position = CGPoint(x: 673, y: 20)

        // Ajustando a escala
        ground.setScale(2)

        // Agora vamos configurar a física do chão que criamos
        groundBody.isDynamic = false // Para o chão não cair para o infinito
        ground.name = "ground" // Colocamos um nome para podermos saber se o personagem colidiu com o chão posteriormente

        ground.physicsBody = groundBody // Aqui o corpo físico que criamos é atribuído à imagem do chão que criamos anteriormente

        // E agora o chão é adicionado à cena
        self.addChild(ground)

        // Agora que o chão está completo, vamos configurar o personagem

        // Essa configuração é necessária para que a função didBegin localizada no final desse arquivo seja chamada cada vez que um objeto colidir com outro.
        physicsWorld.contactDelegate = self;

        // Configuração do personagem
        // Vamos iniciar atribuindo uma imagem ao personagem
        player = SKSpriteNode(imageNamed: "walk1")

        // Posição do personagem
        player.position = CGPoint(x: 200, y: 160)
        // Escala
        player.setScale(0.5)
        // Posicionamos o player na camada 6. Para que fique na frente do cenário (camadas 1 a 6) e atrás das plantas do primeiro plano (camada 7)
        player.zPosition = 6

        // Nome para o elemento, para podermos consultar posteriormente
        player.name = "player"

        // Criando um corpo físico para o personagem
        let playerBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 210))

        // Atribuindo o corpo do personagem à imagem
        player.physicsBody = playerBody

        // Colocando o persoangem na cena
        self.addChild(player)

        // Configuração das animações. Veja a implementação dessas funções mais para baixo nesse mesmo arquivo
        setupBackgroundAnimation()
        setupWalkAnimation()
        setupJumpAnimation()

        // Manda o player executar a animação de caminhada
        player.run(walkAnimation)


        // Presente

        // Carrega a imagem do presente
        gift = SKSpriteNode(imageNamed: "gift")
        // Atribui um nome para identificar o objeto posteriormente
        gift.name = "gift"
        // Ajusta a escala da imagem
        gift.setScale(0.2)
        // Coloca o presente na mesma "camada" do personagem
        gift.zPosition = 6
        // Cria um corpo físico para o presente. Importante para que o sistema detecte quando o personagem colidiu com o presente
        let giftBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        // Desliga a dinâmica do presente. Não queremos que ele caia no cenário, vamos movê-lo por animação
        giftBody.isDynamic = false
        // Atribuímos o corpo físico do presente à representação gráfica
        gift.physicsBody = giftBody
        // Adiciona o presente na cena
        self.addChild(gift)

        // Configura a animação do presente
        setupGiftAnimation()

        // Essas linhas configuram a máscara de contato do personagem para que a função didBegin seja chamada quando o personagem tocar no chão ou no presente. Não se preocupe se isso não estiver bem claro. Veremos com mais detalhes em outras oportunidades. Qualquer dúvida ou necessidade de aprofundamento, converse com os mentores =)
        ground.physicsBody!.categoryBitMask = 1
        gift.physicsBody!.categoryBitMask = 2
        
        player.physicsBody!.contactTestBitMask = ground.physicsBody!.categoryBitMask | gift.physicsBody!.categoryBitMask
        
        player.physicsBody!.collisionBitMask = ground.physicsBody!.categoryBitMask
    }

    func setupBackgroundAnimation() {
        // Aqui cada camada do background é configurada pela função setupLayer. Os números entre parênteses são parâmetros da função, que nesse caso representam cada uma das camadas. A camada 6 está "reservada" para o personagem. Veja a implementação dessa função mais para baixo nesse arquivo.
        setupLayer(1)
        setupLayer(2)
        setupLayer(3)
        setupLayer(4)
        setupLayer(5)
        setupLayer(7)
    }

    func setupWalkAnimation() {
        // Animação de caminhada do personagem

        // Criamos uma lista com todas texturas (imagens ordenadas de todos os frames da caminhada)
        var walkList = [SKTexture]()

        // Cada imagem é adicionada à lista
        walkList.append(SKTexture(imageNamed: "walk1"))
        walkList.append(SKTexture(imageNamed: "walk2"))
        walkList.append(SKTexture(imageNamed: "walk3"))
        walkList.append(SKTexture(imageNamed: "walk2"))
        walkList.append(SKTexture(imageNamed: "walk1"))
        walkList.append(SKTexture(imageNamed: "walk4"))
        walkList.append(SKTexture(imageNamed: "walk5"))
        walkList.append(SKTexture(imageNamed: "walk4"))

        // Criamos a animação que troca as imagens em um determinado intervalo de tempo.
        let walk = SKAction.animate(with: walkList,
                                         timePerFrame: 0.08,
                                         resize: true,
                                         restore: true)

        // Criamos uma repetição para a animação de caminhada e atribuímos à variável "walkAnimation"
        walkAnimation = SKAction.repeatForever(walk)
    }

    func setupJumpAnimation() {
        // Animação de pulo do personagem

        // Carregamos a imagem do personagem pulando
        let jumpTexture = SKTexture(imageNamed: "jump")

        // Criamos a animação que troca a textura do personagem e atribuímos à variável jumpAnimation
        jumpAnimation = SKAction.setTexture(jumpTexture)
    }

    func setupLayer(_ layer: Int) {
        // Configuração das camadas do cenário

        // Carregamos duas imagens iguais para posicioná-las lado a lado (as imagens se encaixam perfeitamente)
        let sprite1 = SKSpriteNode(imageNamed: "layer\(layer)")
        let sprite2 = SKSpriteNode(imageNamed: "layer\(layer)")

        // Movemos a segunda imagem para que ela comece onde a primeira termina. As imagens possuem exatamente a mesma largura da tela
        sprite2.position = CGPoint(x: self.size.width, y: 0)

        // Criamos um elemento para receber os duas imagens como suas "filhas"
        let layerNode = SKNode()
        layerNode.addChild(sprite1)
        layerNode.addChild(sprite2)

        // Colocamos o elemento na camada referente ao parâmetro (layer) recebido no início da função.
        layerNode.zPosition = CGFloat(layer)

        // Posicionamos o elemento bem no centro da tela (a segunda imagem ficará posicionada para fora da tela para o lado direito. As duas imagens irão se deslocar para a esquerda fazendo com que uma saia da cena enquanto a outra entra)
        layerNode.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)

        // Cria a animação para mover as imagens do cenário para a esquerda. O tempo está definido como 3 * (10 - layer). A variável layer entra na conta para que os layers mais baixos se movam mais lentamente. Isso cria o efeito de paralaxe, que dá a impressão que o cenário tem profundidade. O 3 * é para ajustar a velocidade
        let moveLeft = SKAction.moveBy(x: -self.size.width, y: 0, duration: TimeInterval(3 * (10 - layer)))

        // Cria a animação para mover de volta as imagens do cenário para a direita instantaneamente, pois a duração é igual a 0 (zero)
        let moveBack = SKAction.moveBy(x: self.size.width, y: 0, duration: 0)

        // Cria a sequência para mover para e esquerda lentamente e de volta para a direita instantaneamente
        let sequence = SKAction.sequence([moveLeft, moveBack])

        // Cria um loop infinito da sequência criada acima
        let loop = SKAction.repeatForever(sequence)

        // Manda o nó "pai" executar a animação infinita
        layerNode.run(loop)

        // Adiciona o nó "pai" à cena
        self.addChild(layerNode)
    }

    // Função chamada para configurar a animação do presente
    func setupGiftAnimation() {
        // Animações de movimentos do presente para cima e para baixo
        let giftDown = SKAction.moveBy(x: 0, y: -300, duration: 2)
        let giftUp = SKAction.moveBy(x: 0, y: 300, duration: 2)

        // Suaviza as animações para que o objeto acelere e desacelere. Fica mais natural
        giftDown.timingMode = .easeInEaseOut
        giftUp.timingMode = .easeInEaseOut

        // Cria uma sequência com as animações para cima e para baixo
        let giftDownUp = SKAction.sequence([giftDown, giftUp])
        // Repete a sequência para sempre
        let giftDownUpForever = SKAction.repeatForever(giftDownUp)

        // Animação para mover o presente lentamente para a esquerda e de volta para a direita
        let giftMoveLeft = SKAction.moveBy(x: -2100, y: 0, duration: 14)
        let giftMoveRight = SKAction.moveBy(x: 2100, y: 0, duration: 0)
        let giftLeftRight = SKAction.sequence([giftMoveLeft, giftMoveRight])

        // Loop infinito para fazer o presente ficar passando eternamente caso o personagem não pegue-o
        let giftLoop = SKAction.repeatForever(giftLeftRight)

        // Une a animação para cima e para baixo com a animação para esquerda e direita
        let giftAnimation = SKAction.group([giftDownUpForever, giftLoop])

        // Colocando o presente em um ponto para a direita fora da tela
        gift.position = CGPoint(x: 2000, y: 500)

        // Manda o presente rodar a animação completa que foi criada
        gift.run(giftAnimation)
    }

    func jump() {
        // Função chamada cada vez que ocorre um click ou toque na tela

        // Se o personagem já está pulando a função é interrompida. Não queremos que o personagem pule quando já estiver no ar
        if playerStatus == .jumping {
            return // Interrompe a função
        }

        // Mudamos o estado do personagem para sabermos que ele está pulando
        playerStatus = .jumping

        // Removemos todas as animações. No caso a animação de caminhar
        player.removeAllActions()

        // Executamos a animação de pulo do personagem
        player.run(jumpAnimation)

        // Alteramos a velocidade do corpo físico para que o personagem seja lançado para cima. Outra opção é aplicar um impulso ao corpo físico no personagem.
        player.physicsBody!.velocity = CGVector(dx: 0, dy: 1000)
    }

    func walk() {
        // Função chamada no início da cena e cada vez que o personagem bate no chão de volta depois de dar um salto

        // Se o personagem já está caminhando, interrompemos a função
        if playerStatus == .walking {
            return // Interrompe a função
        }

        // Removemos todas as animações existente. No caso a animação de pulo é removida caso o personagem estiver voltando de um salto
        player.removeAllActions()

        // Mudamos o estado do personagem para sabermos que agora ele está caminhando
        playerStatus = .walking

        // Executamos a animação de caminhada
        player.run(walkAnimation)
    }

    // Função chamada quando personagem pega o presente
    func getTheGift() {

        // Removemos todas as animações do presente
        gift.removeAllActions()

        // Removemos o presente da cena
        gift.removeFromParent()

        // Mostramos um texto na tela
        // Criamos uma label (imagem de um texto)
        let label = SKLabelNode(text: "Aqui vai uma frase legal")
        // Definimos a fonte
        label.fontName = "Bradley Hand"
        // Tamanho da fonte
        label.fontSize = 60
        // Começamos com alpha = 0 para que comece invisível
        label.alpha = 0
        // Definimos a posição do texto na tela
        label.position = CGPoint(x: 673, y: 600)
        // Colocamos o texto em uma camada superior para que ele apareça por cima de tudo
        label.zPosition = 10
        // Adicionamos o texto à cena
        self.addChild(label)

        // Criamos uma animação de fade in para que o texto apareça suavemente
        let labelFadeIn = SKAction.fadeIn(withDuration: 2)

        // Mandamos a label executar a animação de fade in que criamos
        label.run(labelFadeIn)
    }

    // Função que recebe a coordenada do ponto clicado na tela
    func touchDown(atPoint pos : CGPoint) {
        // Cada vez que ocorre um toque ou clique na tela a função jump é chamada
        jump()
    }

    // Função chamada cada vez que um objeto toca o outro. Por exemplo, o personagem tocou o chão
    func didBegin(_ contact: SKPhysicsContact) {
        // A colisões ocorrem sempre entre dois elementos A e B. Vamos verificar se o elemento A é o nosso jogador. Se for, vamos chamar a função collision informando que o elemento A, que é o jogador colidiu com o elemento B. A função collision deve saber o que fazer. Caso o elemento A não seja o jogador, vamos verificar se o elemento B é o jogador. Caso seja, vamos também chamar a função collision, porém, nesse caso vamos informara que o elemento B, jogador, colidiu com o elemento A. Caso contrario, a colisão não envolve o jogador e nesse exemplo, não vamos precisar fazer mais nada.
        if contact.bodyA.node!.name! == "player" {
            collision(playerNode: contact.bodyA.node!, otherNode: contact.bodyB.node!)
        } else if contact.bodyB.node!.name! == "player" {
            collision(playerNode: contact.bodyB.node!, otherNode: contact.bodyA.node!)
        }
    }

    // Função chamada para informar que o personagem colidiu com algum objeto. Pode ser o chão ou um item que o personagem pegou no cenário.
    func collision(playerNode : SKNode, otherNode: SKNode) {

        // Caso o outro elemento não tenha nome, a função será interrompida
        if otherNode.name == nil {
            return
        }

        if otherNode.name! == "ground" {
            // Sempre que o personagem colidir com o chão, ele deve começar a caminhar
            walk()
        } else if otherNode.name! == "gift" {
            // Se o personagem colidir com o presente, chamamos a função getTheGift
            getTheGift()
        }
    }

    // Essa parte cuida de monitorar os toques ou cliques na tela. Cada vez que isso acontece essa função chama a nossa outra função touchDown passando a posição exata do toque na tela. Normalmente não precisamos mexer aqui.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
}

// Enum com os dois possíveis estados do personagem
enum PlayerStatus {
    case walking
    case jumping
}
