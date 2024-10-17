//
//  UIImageView+Extension.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit
import SDWebImage
extension UIImageView{
    func setAvatarImage(imageURL : String?){
        guard let url = imageURL else {
            self.image = UIImage(named: "no-image")
            return
        }
        
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        // Load the image
        self.sd_setImage(with: URL(string:url ), placeholderImage: UIImage(named: "no-image"), options: .continueInBackground) { (image, error, cacheType, url) in
            // Optional: Handle any post-load logic here
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
}

