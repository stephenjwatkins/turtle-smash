import Foundation
import UIKit

extension Array {
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}

extension CGSize {
    func scale(factor: CGFloat) -> CGSize {
        return CGSize(
            width: self.width * factor,
            height: self.height * factor
        )
    }
    func centerPoint() -> CGPoint {
        return CGPoint(
            x: self.width / 2.0,
            y: self.height / 2.0
        )
    }
}
