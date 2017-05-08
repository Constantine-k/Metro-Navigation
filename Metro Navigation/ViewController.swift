//
//  ViewController.swift
//  Metro Navigation
//
//  Created by Konstantin Konstantinov on 5/6/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let stationsData = StationsData()
    
    @IBOutlet weak var metroMapView: MetroMapView!
    
    // From and To Station text fields
    @IBOutlet weak var fromStationTextField: UITextField!
    @IBOutlet weak var toStationTextField: UITextField!
    
    private let fromStationPicker = UIPickerView()
    private let toStationPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromStationPicker.delegate = self
        fromStationPicker.tag = 1
        fromStationTextField.inputView = fromStationPicker
        
        toStationPicker.delegate = self
        toStationPicker.tag = 2
        toStationTextField.inputView = toStationPicker
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Picker methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stationsData.namesList().count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            fromStationTextField.text = stationsData.namesList()[row]
            metroMapView.fromStationName = stationsData.namesList()[row]
        } else if pickerView.tag == 2 {
            toStationTextField.text = stationsData.namesList()[row]
            metroMapView.toStationName = stationsData.namesList()[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stationsData.namesList()[row]
    }
    
    // Hide picker on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

