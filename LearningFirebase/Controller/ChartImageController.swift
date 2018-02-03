//
//  ChartImageControllerViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/24/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class ChartImageController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var chartImageView: UIImageView!
    var newImage: UIImage!
    var chartImageViewOrigin: CGPoint!
    var isZooming = false
    var originalImageCenter:CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scaleImage = UIPinchGestureRecognizer(target: self, action: #selector(self.scaleImage(_:)))
        scaleImage.delegate = self
        self.chartImageView.addGestureRecognizer(scaleImage)
        let moveImage = UIPanGestureRecognizer(target: self, action: #selector(self.moveImage(_:)))
        moveImage.delegate = self
        self.chartImageView.addGestureRecognizer(moveImage)
      
        chartImageView.image = newImage
        
//        chartImageViewOrigin = chartImageView.frame.origin
        
        
        
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveImage(_:)))
//        self.chartImageView.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        chartImageView.image = newImage
    }
    
 

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @IBAction func scaleImage(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .began {
            let currentScale = self.chartImageView.frame.size.width / self.chartImageView.bounds.size.width
            let newScale = currentScale*sender.scale
            if newScale > 1 {
                self.isZooming = true
            }
        } else if sender.state == .changed {
            guard let view = sender.view else {return}
            let pinchCenter = CGPoint(x: sender.location(in: view).x - view.bounds.midX,
                                      y: sender.location(in: view).y - view.bounds.midY)
            let transform = view.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
                .scaledBy(x: sender.scale, y: sender.scale)
                .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
            let currentScale = self.chartImageView.frame.size.width / self.chartImageView.bounds.size.width
            var newScale = currentScale*sender.scale
            if newScale < 1 {
                newScale = 1
                let transform = CGAffineTransform(scaleX: newScale, y: newScale)
                self.chartImageView.transform = transform
                sender.scale = 1
            }else {
                view.transform = transform
                sender.scale = 1
            }
        } else if sender.state == .ended || sender.state == .failed || sender.state == .cancelled {
            guard let center = self.originalImageCenter else {return}
            UIView.animate(withDuration: 0.3, animations: {
                self.chartImageView.transform = CGAffineTransform.identity
                self.chartImageView.center = center
            }, completion: { _ in
                self.isZooming = false
            })
        }
    }
    
    @IBAction func moveImage(_ sender: UIPanGestureRecognizer) {
        
        if self.isZooming && sender.state == .began {
            self.originalImageCenter = sender.view?.center
        } else if self.isZooming && sender.state == .changed {
            let translation = sender.translation(in: chartImageView)
            if let view = sender.view {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y + translation.y)
            }
            sender.setTranslation(CGPoint.zero, in: self.chartImageView.superview)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}



