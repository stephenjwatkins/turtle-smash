import Foundation
import SpriteKit

class ScoreLabel : UILabel {
    
    func update(score: Int) {
        self.text = String(score)
    }
    
}