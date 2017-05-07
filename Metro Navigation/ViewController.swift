//
//  ViewController.swift
//  Metro Navigation
//
//  Created by Konstantin Konstantinov on 5/6/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerData = ["Akademgorodok", "Kreschatik", "Arsenalnaya"]
    
    @IBOutlet weak var fromStationTextField: UITextField!
    @IBOutlet weak var toStationTextField: UITextField!
    
    var fromStationPicker = UIPickerView()
    var toStationPicker = UIPickerView()
    
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
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            fromStationTextField.text = pickerData[row]
        } else if pickerView.tag == 2 {
            toStationTextField.text = pickerData[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Hide picker on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

