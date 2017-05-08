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
        static let red = CGPoint(x: 55.0, y: 213.0)
        static let blue = CGPoint(x: 204.0, y: 184.0)
        static let green = CGPoint(x: 172.0, y: 221.0)
    }
    
    /// Text position offset
    private var textOffset: (x: CGFloat, y: CGFloat) = (8.0, -12.0)

    /// Scale of whole Metro Map View
    var scale: CGFloat = 1 { didSet { setNeedsDisplay() } }
    
    private let stationPointRadius: CGFloat = 3.5
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
    
    
    /*/// Draw line of metro stations
    private func drawLineOfStations(usingStartingPoint startingPoint: CGPoint, withStations stations: [String, Double, Double]) {
        
    }*/
    
    
    
    /*private func metroLinePath() -> UIBezierPath {
        for index in viewController.stationsData.stationsRed {
            
        }
    }*/
    
    
    
    override func draw(_ rect: CGRect) {
        var drawingStationPoint = LineStartingPoint.red
        for station in viewController.stationsData.stationsRed {
            //if () {
            UIColor.red.set()
            
            let oldDrawingStationPoint = drawingStationPoint
            
            drawingStationPoint = CGPoint.init(x: drawingStationPoint.x + CGFloat(station.xOffset), y: drawingStationPoint.y + CGFloat(station.yOffset))
            stationPath(atPosition: drawingStationPoint).fill()
            
            if station.xOffset != 550.0 && station.yOffset != 550.0 {
                let stationLine = UIBezierPath()
                stationLine.move(to: oldDrawingStationPoint)
                stationLine.addLine(to: drawingStationPoint)
                stationLine.lineWidth = stationPointLineWidth * scale
                stationLine.stroke()
            }
            
            //let drawingText = NSAttributedString(string: station.name)
            let drawingTextOffset = CGPoint.init(x: drawingStationPoint.x + textOffset.x, y: drawingStationPoint.y + textOffset.y)
            let drawingText = NSAttributedString(string: station.name, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 7)!])
            drawingText.draw(at: drawingTextOffset)
        }
        

        
    }

}
