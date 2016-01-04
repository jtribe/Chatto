//
//  FullScreenPhotoViewController.swift
//  ChattoApp
//
//  Created by Ben on 21/12/2015.
//  Copyright © 2015 Badoo. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {
	
	@IBOutlet weak private var imageView: UIImageView?
	@IBOutlet weak private var backButton: UIButton?
	
	var imageObject: UIImage?
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		imageView?.image = imageObject
		
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	func prepareForDisplay() {
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		var transform = CATransform3DIdentity
		transform.m34 = 1.0 / -500.0
		transform = CATransform3DTranslate(transform, 0.0, 0.0, -200.0)
		view.layer.transform = transform
		view.layer.opacity = 0.0
		
		imageView?.hidden = false
		backButton?.hidden = false
		
		UIView.animateWithDuration(0.5, delay: 1.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveEaseInOut, animations: { [weak self] in
			var transform = CATransform3DIdentity
			transform.m34 = 1.0 / -500.0
			transform = CATransform3DTranslate(transform, 0.0, 0.0, 0.0)
			self?.view.layer.transform = transform
			self?.view.layer.opacity = 1.0
			}, completion: nil)
	}
	
	@IBAction func dismissPhoto() {
		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveEaseInOut, animations: { [weak self] in
			var transform = CATransform3DIdentity
			transform.m34 = 1.0 / -500.0
			transform = CATransform3DTranslate(transform, 0.0, 0.0, -200.0)
			self?.view.layer.transform = transform
			self?.view.layer.opacity = 0.0
			}, completion: { [weak self] finished in
				self?.imageView?.hidden = true
				self?.backButton?.hidden = true
				self?.navigationController?.popViewControllerAnimated(true)
		})
	}
	
}
