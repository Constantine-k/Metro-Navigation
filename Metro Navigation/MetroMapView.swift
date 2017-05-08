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
        static let red = CGPoint(x: 40.0, y: 153.0)
        static let blue = CGPoint(x: 189.0, y: 124.0)
        static let green = CGPoint(x: 154.0, y: 161.0)
    }
    
    /// Text position offset
    private var textOffset: (x: CGFloat, y: CGFloat) = (7.0, -6.0)

    /// Scale of whole Metro Map View
    var scale: CGFloat = 1 { didSet { setNeedsDisplay() } }
    
    private let stationPointRadius: CGFloat = 3.5
    private let stationPointLineWidth: CGFloat = 3.0
    
    private let redColor = UIColor.init(red: 238.0/255.0, green: 30.0/255.0, blue: 37.0/255.0, alpha: 1.0)
    private let blueColor = UIColor.init(red: 3.0/255.0, green: 82.0/255.0, blue: 163.0/255.0, alpha: 1.0)
    private let greenColor = UIColor.init(red: 3.0/255.0, green: 153.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    
    
    //let text = NSAttributedString(string: "Akademmistechko")
    //let stationPoint = CGPoint.init(x: 100.0, y: 100.0)
    
    var fromStationName: String? { didSet { setNeedsDisplay() } }
    var toStationName: String? { didSet { setNeedsDisplay() } }
    
    var viewController = ViewController()
    
    /// Create station Bezier path
    private func stationPath(atPosition positionPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: positionPoint, radius: stationPointRadius * scale, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        //UIColor.red.set()
        path.lineWidth = stationPointLineWidth * scale
        
        return path
    }
    
    
    /// Draw line of metro stations
    func drawLineOfStations(usingStartingPoint startingPoint: CGPoint, withStations stations: [(name: String, xOffset: Double, yOffset: Double, active: Bool)], andColor color: UIColor) {
        var drawingStationPoint = startingPoint
        for station in stations {
            if (station.active == true) {
                UIColor.black.set()
            } else {
                color.set()
            }
            
            let oldDrawingStationPoint = drawingStationPoint
            
            drawingStationPoint = CGPoint.init(x: drawingStationPoint.x + CGFloat(station.xOffset), y: drawingStationPoint.y + CGFloat(station.yOffset))
            stationPath(atPosition: drawingStationPoint).fill()
            
            
            if !(station.xOffset == 0.0 && station.yOffset == 0.0) {
                let stationLine = UIBezierPath()
                stationLine.move(to: oldDrawingStationPoint)
                stationLine.addLine(to: drawingStationPoint)
                stationLine.lineWidth = stationPointLineWidth * scale
                stationLine.stroke()
            }
            
            let drawingTextOffset = CGPoint.init(x: drawingStationPoint.x + textOffset.x, y: drawingStationPoint.y + textOffset.y)
            let drawingText = NSAttributedString(string: station.name, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 7)!])
            drawingText.draw(at: drawingTextOffset)
        }
    }
    
    
    //LineStartingPoint.red
    /*private func metroLinePath() -> UIBezierPath {
        for index in viewController.stationsData.stationsRed {
            
        }
    }*/
    
    
    
    override func draw(_ rect: CGRect) {
        //drawLineOfStations(usingStartingPoint: LineStartingPoint.red, withStations: viewController.stationsData.stationsRed, andColor: redColor)
        drawLineOfStations(usingStartingPoint: LineStartingPoint.red, withStations: viewController.stationsData.makeRoute(fromStation: fromStationName, toStation: toStationName).stationsRed, andColor: redColor)
        drawLineOfStations(usingStartingPoint: LineStartingPoint.blue, withStations: viewController.stationsData.makeRoute(fromStation: fromStationName, toStation: toStationName).stationsBlue, andColor: blueColor)
        drawLineOfStations(usingStartingPoint: LineStartingPoint.green, withStations: viewController.stationsData.makeRoute(fromStation: fromStationName, toStation: toStationName).stationsGreen, andColor: greenColor)
    }

}
