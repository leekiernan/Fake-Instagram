//
//  ProfileController.swift
//  Instagram
//
//  Created by Lee Kiernan on 27/01/2016.
//  Copyright © 2016 Lee Kiernan. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
  @IBOutlet weak var profilePic:UIImageView!
  @IBOutlet weak var postsLabel:UILabel!
  @IBOutlet weak var followingLabel:UILabel!
  @IBOutlet weak var followersLabel:UILabel!
  
  @IBAction func editProfile(sender:AnyObject) {
    print("Edit profile")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let currentUser = Profile.currentUser {
      self.postsLabel.text = "\(currentUser.posts.count)"
      self.followersLabel.text = "\(currentUser.followers.count)"
      self.followingLabel.text = "\(currentUser.following.count)"
      
      if let profilePicture = currentUser.picture {
        self.profilePic.image = profilePicture
      }
    } else {
      print("No users logged in.")
    }
  }
}
