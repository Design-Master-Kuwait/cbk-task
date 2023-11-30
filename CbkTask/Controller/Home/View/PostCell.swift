//
//  PostCell.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import UIKit

/// Post Cell containt all Ui whiich user has posted and it display on home page
class PostCell: UITableViewCell, NibReusable {

    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Post cell configure with object
    /// - Parameter object: Feed Model Ojbject
    func cellConfig(with object: Feed)  {
        lblTitle.text = object.title ?? ""
        imgPost.setImageUsingKF(imgPath: object.image ?? "")
    }
    
    // MARK: IBActiond
    
    // action method on button like click
    /// - Parameter sender: object of button
    @IBAction func btnLikeTapped(_ sender: Any) {
    }
    
    // action method on button comment click
    /// - Parameter sender: object of button
    @IBAction func btnCommentTapped(_ sender: Any) {
    }
}
