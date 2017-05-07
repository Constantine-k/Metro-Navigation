//
//  MetroMapView.swift
//  Metro Navigation
//
//  Created by Konstantin Konstantinov on 5/7/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class MetroMapView: UIView {
    // Positioning and style variables
    
    /// Position of first station on the lines
    private struct LineStartingPoint {
        static let red = CGPoint(x: 80.0, y: 80.0)
        static let blue = CGPoint(x: 20.0, y: 20.0)
        static let green = CGPoint(x: 20.0, y: 20.0)
    }
    
    /// Text position offset
    private var textOffset: (x: CGFloat, y: CGFloat) = (8.0, -12.0)

    /// Scale of whole Metro Map View
    var scale: CGFloat = 1 { didSet { setNeedsDisplay() } }
    
    private let stationPointRadius: CGFloat = 5.0
    private let stationPointLineWidth: CGFloat = 3.0
    
    
    //let text = NSAttributedString(string: "Akademmistechko")
    //let stationPoint = CGPoint.init(x: 100.0, y: 100.0)
    
    var viewController = ViewController()
    
    /// Create station Bezier path
    private func stationPath(atPosition positionPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: positionPoint, radius: stationPointRadius * scale, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        //UIColor.red.set()
        path.lineWidth = stationPointLineWidth * scale
        
        return path
    }
    
    
    
    /*private func metroLinePath() -> UIBezierPath {
        for index in viewController.stationsData.stationsRed {
            
        }
    }*/
    
    
    
    override func draw(_ rect: CGRect) {
        var drawingStationPoint = LineStartingPoint.red
        for station in viewController.stationsData.stationsRed {
            UIColor.red.set()
            
            drawingStationPoint = CGPoint.init(x: drawingStationPoint.x + CGFloat(station.xOffset), y: drawingStationPoint.y + CGFloat(station.yOffset))
            stationPath(atPosition: drawingStationPoint).stroke()
            
            //let drawingText = NSAttributedString(string: station.name)
            let drawingTextOffset = CGPoint.init(x: drawingStationPoint.x + textOffset.x, y: drawingStationPoint.y + textOffset.y)
            let drawingText = NSAttributedString(string: station.name, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 8)!])
            drawingText.draw(at: drawingTextOffset)
        }
        //stationPath().stroke()
        //text.draw(at: stationPoint)
    }

}
