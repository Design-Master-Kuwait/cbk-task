//
//  UIImageView+Kingfisher.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import Foundation
import Kingfisher
import UIKit
extension UIImageView {
    
    /// - Util function to add image with caching
    func setImageUsingKF(imgPath: String?){
        self.contentMode = .scaleAspectFill
        guard let aURL = URL(string:  imgPath ?? "") else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: aURL, placeholder: ImageConstant.placeholder!, options: [.scaleFactor(UIScreen.main.scale),
                                                                              .transition(.fade(1)),
                                                                              .cacheOriginalImage]) {  result in
                                                                                switch result {
                                                                                case .success(let value):
                                                                                    self.image = value.image
                                                                                //   print("Task done for: \(value.source.url?.absoluteString ?? "")")
                                                                                case .failure(let error):
                                                                                    print("Job failed: \(error.localizedDescription)")
                                                                                }
        }
    }
    
}
