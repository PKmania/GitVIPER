//
//  ForkListTableViewCell.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit

class ForkListTableViewCell: UITableViewCell,NibLoadableView,ReusableView {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var lblNoOfFollowers: UILabel!
    @IBOutlet weak var lblNoOfRepo: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var loginNameLabel: UILabel!
   
    @IBOutlet weak var cardView: UIView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        Utils.makeViewCircular(view: self.avatarImageView, borderWidth: 1.0, borderColor: .black)
         Utils.createCardView(view: self.cardView, backgroundColor: .white, borderColor: .white, borderWidth: 2.0, cornerRadius: 15.0)
    }

     func setData(owner : ForkListResponse){
        self.avatarImageView.setAvatarImage(imageURL: owner.avatarURL)
        self.loginNameLabel.text = owner.login ?? "No Login Name"
         self.lblBio.text = owner.bio ?? "Bio is Empty."
         self.lblNoOfRepo.text = "No of repositories \(owner.publicRepos)"
         self.lblNoOfFollowers.text = "No of followers \(owner.followers)"
         
    }
}
