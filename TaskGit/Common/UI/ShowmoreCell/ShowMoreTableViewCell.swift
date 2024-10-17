//
//  ShowMoreTableViewCell.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit

class ShowMoreTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var cardView: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.createCardView(view: self.cardView, backgroundColor: .white, borderColor: .white, borderWidth: 2.0, cornerRadius: 15.0)
        self.selectionStyle = .none
    }

}
