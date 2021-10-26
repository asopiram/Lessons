//
//  SnakeHead.swift
//  Lesson8_snake
//
//  Created by Дмитрий Шароваров on 21.10.2021.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init(atPOint point: CGPoint) {
        super.init(atPOint: point)
        self.physicsBody?.categoryBitMask = CollisonCategories.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisonCategories.EdgeBody | CollisonCategories.Apple | CollisonCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
