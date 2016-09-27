//
//  CircleViewModel.swift
//  colorBall
//
//  Created by Ronny Glotzbach on 27.09.16.
//  Copyright © 2016 ronatory. All rights reserved.
//

import ChameleonFramework
import UIKit
import RxSwift
import RxCocoa

class CircleViewModel {
	
	var centerVariable = Variable<CGPoint?>(CGPointZero) // create one variable that will be changed and observed
	var backgroundColorObservable: Observable<UIColor>! // create observable that will change background color based on center
	
	init() {
		setup()
	}
	
	func setup() {
		// if there is a new center emit a new UIColor
		backgroundColorObservable = centerVariable.asObservable()
			.map { center in
				guard let center = center else { return UIColor.flatten(UIColor.blackColor())() }
				
				let red: CGFloat = ((center.x + center.y) %	255.0) / 255.0 // manipulate red
				let green: CGFloat = 0.0
				let blue: CGFloat = 0.0
				
				return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
		}
		
		// 
	}
	
}