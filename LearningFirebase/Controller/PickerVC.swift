//
//  PickerVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/17/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit

class Currency {
    var orders: String
    var pairs: [String]
    
    init(orders:String, pairs:[String]) {
        self.orders = orders
        self.pairs  = pairs
    }
}


class PickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var signalButton: UIButton!
    

    var currencies = [Currency]()
    var onSave: ((_ orderData: String,_ pairData: String, _ priceData: String) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencies.append(Currency(orders: "BUY", pairs:["AUD/CAD",
                                                         "AUD/CHF",
                                                         "AUD/JPY",
                                                         "AUD/NZD",
                                                         "AUD/USD",
                                                         "CAD/CHF",
                                                         "CAD/JPY",
                                                         "CHF/JPY",
                                                         "EUR/AUD",
                                                         "EUR/CAD",
                                                         "EUR/CHF",
                                                         "EUR/GBP",
                                                         "EUR/JPY",
                                                         "EUR/NZD",
                                                         "EUR/USD",
                                                         "GBP/AUD",
                                                         "GBP/CAD",
                                                         "GBP/CHF",
                                                         "GBP/JPY",
                                                         "GBP/NZD",
                                                         "GBP/USD",
                                                         "NZD/CAD",
                                                         "NZD/CHF",
                                                         "NZD/JPY",
                                                         "NZD/USD",
                                                         "USD/CAD",
                                                         "USD/CHF",
                                                         "USD/JPY"
            ]))
        currencies.append(Currency(orders: "SELL", pairs:["AUD/CAD",
                                                          "AUD/CHF",
                                                          "AUD/JPY",
                                                          "AUD/NZD",
                                                          "AUD/USD",
                                                          "CAD/CHF",
                                                          "CAD/JPY",
                                                          "CHF/JPY",
                                                          "EUR/AUD",
                                                          "EUR/CAD",
                                                          "EUR/CHF",
                                                          "EUR/GBP",
                                                          "EUR/JPY",
                                                          "EUR/NZD",
                                                          "EUR/USD",
                                                          "GBP/AUD",
                                                          "GBP/CAD",
                                                          "GBP/CHF",
                                                          "GBP/JPY",
                                                          "GBP/NZD",
                                                          "GBP/USD",
                                                          "NZD/CAD",
                                                          "NZD/CHF",
                                                          "NZD/JPY",
                                                          "NZD/USD",
                                                          "USD/CAD",
                                                          "USD/CHF",
                                                          "USD/JPY"
            ]))
        currencies.append(Currency(orders: "BUY STOP", pairs: ["AUD/CAD",
                                                               "AUD/CHF",
                                                               "AUD/JPY",
                                                               "AUD/NZD",
                                                               "AUD/USD",
                                                               "CAD/CHF",
                                                               "CAD/JPY",
                                                               "CHF/JPY",
                                                               "EUR/AUD",
                                                               "EUR/CAD",
                                                               "EUR/CHF",
                                                               "EUR/GBP",
                                                               "EUR/JPY",
                                                               "EUR/NZD",
                                                               "EUR/USD",
                                                               "GBP/AUD",
                                                               "GBP/CAD",
                                                               "GBP/CHF",
                                                               "GBP/JPY",
                                                               "GBP/NZD",
                                                               "GBP/USD",
                                                               "NZD/CAD",
                                                               "NZD/CHF",
                                                               "NZD/JPY",
                                                               "NZD/USD",
                                                               "USD/CAD",
                                                               "USD/CHF",
                                                               "USD/JPY"
            ]))
        currencies.append(Currency(orders: "SELL STOP", pairs: ["AUD/CAD",
                                                                "AUD/CHF",
                                                                "AUD/JPY",
                                                                "AUD/NZD",
                                                                "AUD/USD",
                                                                "CAD/CHF",
                                                                "CAD/JPY",
                                                                "CHF/JPY",
                                                                "EUR/AUD",
                                                                "EUR/CAD",
                                                                "EUR/CHF",
                                                                "EUR/GBP",
                                                                "EUR/JPY",
                                                                "EUR/NZD",
                                                                "EUR/USD",
                                                                "GBP/AUD",
                                                                "GBP/CAD",
                                                                "GBP/CHF",
                                                                "GBP/JPY",
                                                                "GBP/NZD",
                                                                "GBP/USD",
                                                                "NZD/CAD",
                                                                "NZD/CHF",
                                                                "NZD/JPY",
                                                                "NZD/USD",
                                                                "USD/CAD",
                                                                "USD/CHF",
                                                                "USD/JPY"
            ]))
        currencies.append(Currency(orders: "BUY LIMIT", pairs: ["AUD/CAD",
                                                                "AUD/CHF",
                                                                "AUD/JPY",
                                                                "AUD/NZD",
                                                                "AUD/USD",
                                                                "CAD/CHF",
                                                                "CAD/JPY",
                                                                "CHF/JPY",
                                                                "EUR/AUD",
                                                                "EUR/CAD",
                                                                "EUR/CHF",
                                                                "EUR/GBP",
                                                                "EUR/JPY",
                                                                "EUR/NZD",
                                                                "EUR/USD",
                                                                "GBP/AUD",
                                                                "GBP/CAD",
                                                                "GBP/CHF",
                                                                "GBP/JPY",
                                                                "GBP/NZD",
                                                                "GBP/USD",
                                                                "NZD/CAD",
                                                                "NZD/CHF",
                                                                "NZD/JPY",
                                                                "NZD/USD",
                                                                "USD/CAD",
                                                                "USD/CHF",
                                                                "USD/JPY"
            ]))

        currencies.append(Currency(orders:"SELL LIMIT", pairs:  ["AUD/CAD",
                                                                   "AUD/CHF",
                                                                   "AUD/JPY",
                                                                   "AUD/NZD",
                                                                   "AUD/USD",
                                                                   "CAD/CHF",
                                                                   "CAD/JPY",
                                                                   "CHF/JPY",
                                                                   "EUR/AUD",
                                                                   "EUR/CAD",
                                                                   "EUR/CHF",
                                                                   "EUR/GBP",
                                                                   "EUR/JPY",
                                                                   "EUR/NZD",
                                                                   "EUR/USD",
                                                                   "GBP/AUD",
                                                                   "GBP/CAD",
                                                                   "GBP/CHF",
                                                                   "GBP/JPY",
                                                                   "GBP/NZD",
                                                                   "GBP/USD",
                                                                   "NZD/CAD",
                                                                   "NZD/CHF",
                                                                   "NZD/JPY",
                                                                   "NZD/USD",
                                                                   "USD/CAD",
                                                                   "USD/CHF",
                                                                   "USD/JPY"
                                                                ]))

        pickerView.dataSource = self
        pickerView.delegate = self

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return currencies.count
        } else {
            let selectedCurrency = pickerView.selectedRow(inComponent: 0)
            return currencies[selectedCurrency].pairs.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return currencies[row].orders
        } else {
            let selectedCurrency = pickerView.selectedRow(inComponent: 0)
            return currencies[selectedCurrency].pairs[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedOrder = pickerView.selectedRow(inComponent: 0)
        let selectedPair = pickerView.selectedRow(inComponent: 1)
        let order = currencies[selectedOrder].orders
        let pair = currencies[selectedOrder].pairs[selectedPair]

    }
    
    var pickerOrders: String {
        get {
            let selectedOrder = pickerView.selectedRow(inComponent: 0)
            let order = currencies[selectedOrder].orders
            return order
        }
    }
    var pickerPairs: String {
        get {
            let selectedOrder = pickerView.selectedRow(inComponent: 0)
            let selectedPair = pickerView.selectedRow(inComponent: 1)
            let pair = currencies[selectedOrder].pairs[selectedPair]
            return pair
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func sendSignalTapped(_ sender: UIButton) {
        if pickerView != nil {
            onSave?(pickerOrders, pickerPairs, priceTF.text!)
        }
        dismiss(animated: true)
    }

}
