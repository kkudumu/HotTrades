//
//  ChartVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/17/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import WebKit
class ChartVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if viewcontroller.datapassedfromimagepicker = "AUD/USD" {
        //AUDUSD
        //} else if viewcontroller.datapassedfromuipicker = "AUD/CAD {
        //AUDCAD }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //webviews for charts through tradingview / dailyfx
    func AUDCAD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AAUDCAD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AAUDCAD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func AUDCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AAUDCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AAUDCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func AUDJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AAUDJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AAUDJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func AUDNZD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AAUDNZD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AAUDNZD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func AUDUSD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AAUDUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AAUDUSD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func CADCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ACADCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ACADCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func CADJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ACADJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ACADJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func CHFJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ACHFJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ACHFJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURAUD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURAUD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURAUD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURCAD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURCAD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURCAD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURGBP() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURGBP&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURGBP")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    func EURNZD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURNZD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURNZD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func EURUSD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AEURUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AEURUSD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPAUD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPAUD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPAUD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPCAD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPCAD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPCAD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPNZD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPNZD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPNZD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func GBPUSD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AGBPUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AGBPUSD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func NZDCAD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ANZDCAD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ANZDCAD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func NZDCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ANZDCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ANZDCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func NZDJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ANZDJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ANZDJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func NZDUSD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3ANZDUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3ANZDUSD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func USDCAD() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AUSDCAD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AUSDCAD")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    func USDCHF() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AUSDCHF&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AUSDCHF")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    func USDJPY() {
        let url:URL = URL(string: "https://s.tradingview.com/widgetembed/?symbol=FX_IDC%3AUSDJPY&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=1&toolbarbg=f4f7f9&studies=%5B%5D&hideideas=1&theme=White&timezone=exchange&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_source=www.dailyfx.com&utm_medium=widget&utm_campaign=chart&utm_term=FX_IDC%3AUSDJPY")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    
    
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
