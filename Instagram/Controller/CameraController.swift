//
//  CameraController.swift
//  Instagram
//
//  Created by Lee Kiernan on 29/01/2016.
//  Copyright © 2016 Lee Kiernan. All rights reserved.
//

import UIKit

class CameraController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CaptionDelegate {
  @IBOutlet weak var selectedImageView: UIImageView!
  @IBOutlet weak var sourceLabel: UILabel!
  
  var selectedImage: UIImage?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    sourceLabel.text = "No image selected"
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage
    
    self.selectedImageView.image = selectedImage
    
    if picker.sourceType == .Camera {
      sourceLabel.text = "PHOTO"
    } else if picker.sourceType == .PhotoLibrary {
      sourceLabel.text = "LIBRARY"
    }
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func captionController(controller: CaptionController, didFinishWithCaption caption: String) {
    controller.dismissViewControllerAnimated(true, completion: nil)
    let newPost = Post.init(creator: Profile.currentUser!.username, image: selectedImage, caption: caption)
    Post.feed!.append(newPost)
    Profile.currentUser!.posts.append(newPost)
    
    let tabBarController = self.presentingViewController as? UITabBarController

    tabBarController!.selectedIndex = 0
    
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let destinationVC = segue.destinationViewController as! CaptionController
    
    destinationVC.selectedImage = selectedImage
    destinationVC.delegate = self
  }
  
  @IBAction func takePhoto(sender: UIButton!) {
    let picker = UIImagePickerController()
    
    picker.allowsEditing = true
    picker.sourceType = .Camera
    picker.delegate = self
    
    self.presentViewController(picker, animated: true, completion: nil)
  }

  @IBAction func selectPhoto(sender: UIButton!) {
    let picker = UIImagePickerController()
    
    picker.allowsEditing = true
    picker.sourceType = .PhotoLibrary
    picker.delegate = self
    
    self.presentViewController(picker, animated: true, completion: nil)
  }
  
  @IBAction func dismissPhotoPicker(sender: UIButton!) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
