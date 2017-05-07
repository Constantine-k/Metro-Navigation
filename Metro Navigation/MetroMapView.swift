//
//  MetroMapView.swift
//  Metro Navigation
//
//  Created by Konstantin Konstantinov on 5/7/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class MetroMapView: UIView {

    /// Scale of Metro Map View
    var scale: CGFloat = 1 { didSet { setNeedsDisplay() } }
    
    private let stationPointRadius: CGFloat = 10.0
    private let stationPointLineWidth: CGFloat = 5.0
    
    let text = NSAttributedString(string: "Akademmistechko")
    
    let stationPoint = CGPoint.init(x: 100.0, y: 100.0)
    
    /// Create station Bezier path
    private func stationPath() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: stationPoint, radius: stationPointRadius * scale, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        UIColor.red.set()
        path.lineWidth = stationPointLineWidth * scale
        
        return path
    }
    
    override func draw(_ rect: CGRect) {
        stationPath().stroke()
        text.draw(at: stationPoint)
    }
    
    // Station point shape
    /*struct stationPoint {
     static let
     }*/

}
