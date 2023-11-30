//
//  PhotoCell.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import UIKit

/// PhotoCell For display cell of user photos in Porfile VC
class PhotoCell: UITableViewCell, NibReusable {

    @IBOutlet weak var imgPhotoFeed: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Cell configuration
    /// - Parameter object: String
    func cellConfigh(with object: String) {
        imgPhotoFeed.setImageUsingKF(imgPath: object)

    }
    
}
