//
//  PartialScrollView.swift
//  TestBed
//
//  Created by Joshua Park on 16.06.13..
//  Copyright © 2016 Monetor. All rights reserved.
//

import UIKit

public class PartialScrollView: UIScrollView {
    public weak var scrollableView: UIView?
    public var scrollArea: CGRect?
    public var enableGlobalScroll = false
    
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let scrollableView = scrollableView {
            scrollArea = convert(scrollableView.frame, from: scrollableView.superview)
        }
        let relativePoint = superview!.convert(point, from: self)
        let relativeArea = superview!.convert((scrollArea ?? bounds), from: self)
        if !enableGlobalScroll && !relativeArea.contains(relativePoint) {
            return nil
        }
        return super.hitTest(point, with: event)
    }
}
