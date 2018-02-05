//
//  ChartImageControllerViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/24/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase
import InstaZoom

class ChartImageController: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var chartImageView: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        ImageViewInit()
   
    }
    
    func ImageViewInit() {
        chartImageView = UIImageView()
        chartImageView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        chartImageView.image = newImage
        chartImageView.contentMode = .scaleAspectFit
        chartImageView.backgroundColor = UIColor.black
        scrollView.backgroundColor = UIColor.black
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 0.02
        scrollView.bounces = true
        scrollView.bouncesZoom = true
        scrollView.contentMode = .scaleAspectFit
        scrollView.contentSize = newImage.size
        scrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        scrollView.addSubview(chartImageView)
        setZoomScale()
    }
    
    var minZoomScale:CGFloat!
    
    func setZoomScale(){
        let imageViewSize = chartImageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        minZoomScale = max(widthScale, heightScale)
        scrollView.minimumZoomScale = minZoomScale
        scrollView.zoomScale = minZoomScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return chartImageView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}





