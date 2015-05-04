import Foundation
import SpriteKit

class SmashersView : SKView {
    
    override func didMoveToSuperview() {
        self.ignoresSiblingOrder = true
    }
    
}