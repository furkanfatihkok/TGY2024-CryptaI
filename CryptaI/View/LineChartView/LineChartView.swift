//
//  LineChartView.swift
//  CryptaI
//
//  Created by FFK on 9.05.2024.
//

import UIKit

class LineChartView: UIView {
    
    var sparkline: [Double]? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let sparkline = sparkline else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let width = rect.width
        let height = rect.height
        
        guard let maxPrice = sparkline.max(), let minPrice = sparkline.min() else { return }
        let priceRange = maxPrice - minPrice
        
        let stepX = width / CGFloat(sparkline.count - 1)
        let stepY = height / CGFloat(priceRange)
        
        context.setStrokeColor(UIColor.primaryPurple.cgColor)
        context.setLineWidth(2.0)
        
        for (index, price) in sparkline.enumerated() {
            let x = CGFloat(index) * stepX
            let y = height - CGFloat(price - minPrice) * stepY
            if index == 0 {
                context.move(to: CGPoint(x: x, y: y))
            } else {
                context.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        context.strokePath()
    }

}
