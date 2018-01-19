//
//  ChfJpyVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/18/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import WebKit

class ChfJpyVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var webView: WKWebView!


    override func viewDidLoad() {
        super.viewDidLoad()
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ACHFJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ACHFJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView?.load(urlRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
