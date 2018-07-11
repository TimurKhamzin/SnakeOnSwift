//
//  SnakeView.swift
//  Snake
//
//  Created by Timur Khamzin on 7/11/18.
//  Copyright © 2018 TKH. All rights reserved.
//

import UIKit

protocol SnakeViewDelegate {
    func snakeForSnakeView(_ view:SnakeView) -> Snake?
    func pointOfFruitForSnakeView (_ view:SnakeView) -> Point?
}

class SnakeView: UIView {
    
    var delegate: SnakeViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }
    
    override func draw(_ rect:CGRect) {
        super.draw(rect)
        
        UIColor.lightGray.set()
        UIBezierPath(rect:rect).fill()
        
        if let snake:Snake = delegate?.snakeForSnakeView(self) {
            let worldSize = snake.worldSize
            let titleSize = self.bounds.size.height
            
            if worldSize <= 0{
                return
            }
            let w = Int(Float(titleSize) / Float(worldSize))
            let h = Int(Float(titleSize) / Float(worldSize))
            
            UIColor.black.set()
            let points = snake.points
            for point in points {
                let rect = CGRect(x: point.x * w, y: point.y * h, width: w, height: h)
                UIBezierPath(rect: rect).fill()
            }
            
            if let fruit = delegate?.pointOfFruitForSnakeView (self) {
                UIColor.red.set()
                let rect = CGRect(x: point.x * w, y: point.y * h, width: w, height: h)
                UIBezierPath(ovalIn: rect).fill()
            }
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
