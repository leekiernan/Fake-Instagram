//
//  CentreTabBarController.swift
//  Instagram
//
//  Created by Lee Kiernan on 29/01/2016.
//  Copyright © 2016 Lee Kiernan. All rights reserved.
//

import UIKit

class CentreTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let centreButton = UIButton(type: .Custom)
    let buttonImage = UIImage(named: "camera")
    let numberOfTabs = self.viewControllers!.count
    
    if buttonImage != nil {
      let screenWidth = UIScreen.mainScreen().bounds.size.width
      
      centreButton.frame = CGRectMake(0, 0, screenWidth/CGFloat(numberOfTabs), self.tabBar.frame.size.height)
      centreButton.setImage(buttonImage, forState: .Normal)
      centreButton.tintColor = UIColor.whiteColor()
      centreButton.backgroundColor = UIColor(red: 204/255.0, green: 102/255.0, blue: 255/255.0, alpha: 1.0)
      
      centreButton.center = self.tabBar.center
      centreButton.addTarget(self, action: "showCamera:", forControlEvents: .TouchUpInside)
      
      self.view.addSubview(centreButton)
    }
  }
  
  func showCamera(sender: UIButton!) {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    let cameraPicker = mainStoryboard.instantiateViewControllerWithIdentifier("CameraPopup")
    
    self.presentViewController(cameraPicker, animated: true, completion: nil)
  }
}
