import Foundation
import UIKit

class SmashersViewController : UIViewController {
    
    var smashersScene: SmashersScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        smashersScene = SmashersScene(size: self.view.bounds.size)
        (self.view as SmashersView).presentScene(smashersScene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
