import SpriteKit

class SmashersScene : SKScene {
    
    var smashersBeingPressed: [Smasher] = []
    
    override func didMoveToView(view: SKView) {
        self.scaleMode = .ResizeFill
        self.backgroundColor = Colors["BaseGreen"]!
        
        let grid = SmashersGrid.initWithScene(self)
        grid.createSmashers()
        
        GameManager.currentGame!.smashersGrid = grid
        
        if SettingsManager.get("alreadyShowedHelper") != nil {
            GameManager.currentGame!.start()
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if GameManager.currentGame!.isPendingOver {
            return
        }
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let node = nodeAtPoint(location)
            
            if !(node is SKScene) {
                let smasher = Smasher.getFromChild(node)
                
                if smasher.state == Smasher.States.Inactive {
                    smasher.invalidPress()
                    GameManager.currentGame!.invalidPress()
                    delay(0.6) {
                        GameManager.currentGame!.over()
                    }
                } else if smasher.state == Smasher.States.Highlighted {
                    self.smashersBeingPressed.append(smasher)
                    smasher.pressBegins()
                }
            }
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for smasher in self.smashersBeingPressed {
            smasher.pressEnds()
            GameManager.currentGame!.press(smasher)
            self.smashersBeingPressed.removeObject(smasher)
        }
    }
    
}
