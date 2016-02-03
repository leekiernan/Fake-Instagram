//
//  CaptionController.swift
//  Instagram
//
//  Created by Lee Kiernan on 29/01/2016.
//  Copyright © 2016 Lee Kiernan. All rights reserved.
//

import UIKit

protocol CaptionDelegate {
  func captionController(controller: CaptionController, didFinishWithCaption caption: String)
}

class CaptionController: UIViewController {
  @IBOutlet weak var captionText:UITextView!
  @IBOutlet weak var imagePreview:UIImageView!
  
  var selectedImage:UIImage!
  var delegate: CaptionDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePreview.image = selectedImage
  }
  
  @IBAction func submitPressed(sender: UIButton!) {
    if let captionDelegate = self.delegate {
      captionDelegate.captionController(self, didFinishWithCaption: captionText.text)
    }
  }
  @IBAction func backPressed(sender:UIButton!) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func tab(sender:UITapGestureRecognizer!) {
    captionText.resignFirstResponder()
  }
}
