//import UIKit
//
//class LineChartView: UIView {
//    
//    var sparkline: [Double] = [] {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    override func draw(_ rect: CGRect) {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
//        shadowColor.setFill()
//        
//        context.beginPath()
//        context.move(to: CGPoint(x: 0, y: rect.height))
//        for (index, value) in sparkline.enumerated() {
//            let x = CGFloat(index) * rect.width / CGFloat(sparkline.count - 1)
//            let y = rect.height - CGFloat(value) * rect.height / CGFloat(sparkline.max() ?? 1)
//            context.addLine(to: CGPoint(x: x, y: y))
//        }
//        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
//        context.closePath()
//        context.fillPath()
//        
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.setLineWidth(2.0)
//        
//        context.beginPath()
//        for (index, value) in sparkline.enumerated() {
//            let x = CGFloat(index) * rect.width / CGFloat(sparkline.count - 1)
//            let y = rect.height - CGFloat(value) * rect.height / CGFloat(sparkline.max() ?? 1)
//            
//            if index == 0 {
//                context.move(to: CGPoint(x: x, y: y))
//            } else {
//                context.addLine(to: CGPoint(x: x, y: y))
//            }
//        }
//        context.strokePath()
//        
//        for (index, value) in sparkline.enumerated() {
//            let x = CGFloat(index) * rect.width / CGFloat(sparkline.count - 1)
//            let y = rect.height - CGFloat(value) * rect.height / CGFloat(sparkline.max() ?? 1)
//            
//            let path = UIBezierPath(ovalIn: CGRect(x: x - 1.5, y: y - 1.5, width: 3.0, height: 3.0))
//            UIColor.black.setFill()
//            path.fill()
//        }
//    }
//    
//}
