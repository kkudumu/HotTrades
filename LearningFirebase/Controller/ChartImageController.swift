//
//  ChartImageControllerViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/24/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class ChartImageController: UIViewController {

    @IBOutlet weak var chartImageView: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       chartImageView.image = newImage
        
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveImage(_:)))
//        self.chartImageView.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        chartImageView.image = newImage
    }

    @IBAction func scaleImage(_ sender: UIPinchGestureRecognizer) {
        
        chartImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    
    @IBAction func moveImage(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(.zero, in: self.view)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}


