import Foundation
import SpriteKit

class ScoreManager {
    class func saveLastScore(score: Int) {
        SettingsManager.set("lastScore", value: score)
    }
    
    class func getLastScore() -> Int? {
        return SettingsManager.get("lastScore") as Int?
    }
    
    class func saveHighScore(score: Int) {
        SettingsManager.set("highScore", value: score)
    }
    
    class func getHighScore() -> Int? {
        return SettingsManager.get("highScore") as Int?
    }
    
    class func saveNewScore(score: Int) {
        ScoreManager.saveLastScore(score)
        if let currentHighScore = ScoreManager.getHighScore() {
            if score > currentHighScore {
                ScoreManager.saveHighScore(score)
            }
        } else {
            ScoreManager.saveHighScore(score)
        }
    }
}
