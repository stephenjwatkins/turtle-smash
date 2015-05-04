import Foundation

class GameManager {
    
    private struct ClassVar {
        static var _currentGame: Game?
    }
    
    class var currentGame: Game? {
        get { return ClassVar._currentGame }
        set { ClassVar._currentGame = newValue }
    }
    
    class func newGame(view: GameView) -> Game {
        self.currentGame = Game(view: view)
        return self.currentGame!
    }
    
}