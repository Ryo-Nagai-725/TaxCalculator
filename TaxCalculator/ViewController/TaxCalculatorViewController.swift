//
//  TaxCalculatorViewController.swift
//  TaxCalculator
//
//  Created by 永井涼 on 2020/12/21.
//

import UIKit

class TaxCalculatorViewController: UIViewController {
    @IBOutlet weak var disCountPickerView: UIPickerView!
    @IBOutlet weak var taxResultLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceTextFiled: UITextField!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var taxPriceLabel: UILabel!
    @IBOutlet weak var taxRateLabel: UILabel!
    let integerList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99"]
    let disCountList = ["％引き","割引"]
    let tenTax:Double = 0.1
    let eightTax: Double = 0.08
    var disCount: Double = 0.0
    var tenTaxResult: String = ""
    var tenTaxPriceResult: String = ""
    var eightTaxResult: String = ""
    var eightTaxPriceResult: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiscountPickerView()
        setupPriceTextField()
        naviIsHidden()
        cornerRadius()
    }
    
    @IBAction func changedTextFiled(_ sender: Any) {
        self.priceLabel.text = "¥ " + (self.priceTextFiled.text ?? "")
    }
    
    @IBAction func tapTaxSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            guard let priceText = Double(priceTextFiled.text ?? "") else { return  }
            let tenResult = priceText * tenTax
            let textReflect = Int(tenResult)
            tenTaxResult = "¥ " + String(textReflect)
            
            taxResultLabel.text = tenTaxResult
            
            let tenTaxPrice = priceText + priceText * tenTax
            let textTaxPriceReflect = Int(tenTaxPrice)
            tenTaxPriceResult = "¥ " + String(textTaxPriceReflect)
            
            taxPriceLabel.text = tenTaxPriceResult
            taxRateLabel.text = "10％"
        case 1:
            guard let priceText = Double(priceTextFiled.text ?? "") else { return  }
            let eightResult = priceText * eightTax
            let textReflect = Int(eightResult)
            eightTaxResult = "¥ " + String(textReflect)
            
            taxResultLabel.text = eightTaxResult
            
            let eightTaxPrice = priceText + priceText * eightTax
            let textTaxPriceReflect = Int(eightTaxPrice)
            eightTaxPriceResult = "¥ " + String(textTaxPriceReflect)
            
            taxPriceLabel.text = eightTaxPriceResult
            
            taxRateLabel.text = "8％"
        
        default:
            guard let priceText = Double(priceTextFiled.text ?? "") else { return  }
            let tenResult = priceText * tenTax
            let textReflect = Int(tenResult)
            tenTaxResult = "¥ " + String(textReflect)
            
            taxResultLabel.text = tenTaxResult
            
            let tenTaxPrice = priceText + priceText * tenTax
            let textTaxPriceReflect = Int(tenTaxPrice)
            tenTaxPriceResult = "¥ " + String(textTaxPriceReflect)
            
            taxPriceLabel.text = tenTaxPriceResult
            
            taxRateLabel.text = "10％"
        }
    }
    
    func setupPriceTextField() {
        priceTextFiled.delegate = self
    }
    
    func setupDiscountPickerView() {
        disCountPickerView.delegate = self
        disCountPickerView.dataSource = self
    }
    func naviIsHidden() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func cornerRadius() {
        resultView.layer.cornerRadius = 20.0
        priceTextFiled.layer.cornerRadius = 20.0
        settingView.layer.cornerRadius = 20.0
    }
    
}

extension TaxCalculatorViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return integerList.count
        case 1:
            return disCountList.count
        default:
            return 0
        }
    }
    
    
}

extension TaxCalculatorViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return integerList[row]
        case 1:
            return disCountList[row]
        default:
            return "error"
        }
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
}

extension TaxCalculatorViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        priceTextFiled.resignFirstResponder()
    }
}
