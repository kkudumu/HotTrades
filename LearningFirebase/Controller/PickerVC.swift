//
//  PickerVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/17/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase


class Currency {
    var orders: String
    var pairs: [String]
    
    init(orders:String, pairs:[String]) {
        self.orders = orders
        self.pairs  = pairs
    }
}


class PickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var tapLabel: UILabel!
    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var signalButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    var currencies = [Currency]()
    var onSave: ((_ orderData: String,_ pairData: String, _ priceData: String, _ imageUrl: String) -> ())?
    var freeUserSave: ((_ orderData: String,_ pairData: String, _ priceData: String, _ imageUrl: String) -> ())?
    
    
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
        
        imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            uploadImageView.image = image
            tapLabel.isHidden = true
        } else {
            print("A valid image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func sendSignalTapped(_ sender: UIButton) {
        if pickerView != nil {
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("postImages").child("\(imageName).jpg")
            guard let imageUploadCheck = self.uploadImageView.image else {return}
            
            
            
            if let uploadData = UIImageJPEGRepresentation(imageUploadCheck, 0.1 ) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    let pathURL = metadata?.downloadURL()?.absoluteString
//                    let pathString = pathURL?.path
                    self.onSave?(self.pickerOrders, self.pickerPairs, self.priceTF.text!, pathURL!)
                    print(metadata)
                })
            }
        }
        dismiss(animated: true)
    }
    
    @IBAction func freeSignalTapped(_ sender: UIButton) {
        if pickerView != nil {
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("postImages").child("\(imageName).jpg")
            guard let imageUploadCheck = self.uploadImageView.image else {return}
            
            
            
            if let uploadData = UIImageJPEGRepresentation(imageUploadCheck, 0.1 ) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    let pathURL = metadata?.downloadURL()?.absoluteString
                    //                    let pathString = pathURL?.path
                    self.freeUserSave?(self.pickerOrders, self.pickerPairs, self.priceTF.text!, pathURL!)
                    print(metadata)
                })
            }
        }
        dismiss(animated: true)
    }
    
    
    
    

}
