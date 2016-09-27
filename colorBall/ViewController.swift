//
//  ViewController.swift
//  colorBall
//
//  Created by ronatory on 27.09.16.
//  Copyright © 2016 ronatory. All rights reserved.
//

import ChameleonFramework
import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

	var circleView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	func setup() {
		// add circle
		circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
		circleView.layer.cornerRadius = circleView.frame.width / 2.0
		circleView.center = view.center
		circleView.backgroundColor = UIColor.blueColor()
		view.addSubview(circleView)
		
		// add gesture recognizer
		let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.circleMoved(_:)))
		circleView.addGestureRecognizer(gestureRecognizer)
	}
	
	func circleMoved(recognizer: UIPanGestureRecognizer) {
		let location = recognizer.locationInView(view)
		UIView.animateWithDuration(0.1) {
			self.circleView.center = location
		}
	}

}

