//
//  PostModel.swift
//  Instagram
//
//  Created by Lee Kiernan on 27/01/2016.
//  Copyright © 2016 Lee Kiernan. All rights reserved.
//

import UIKit

class Post {
  let creator:String
  let timestamp:NSDate
  let image:UIImage?
  let caption:String?
  
  static var feed:Array<Post>?
  
  init(creator:String, image:UIImage?, caption:String?) {
    self.image = image
    self.creator = creator
    self.caption = caption

    timestamp = NSDate()
    
  }
}

class PostCell: UITableViewCell {
  @IBOutlet weak var captionLabel:UILabel!
  @IBOutlet weak var imgView:UIImageView!
}


class PostHeaderCell: UITableViewCell {
  @IBOutlet weak var profilePicture:UIImageView!
  @IBOutlet weak var usernameButton:UIButton!
}