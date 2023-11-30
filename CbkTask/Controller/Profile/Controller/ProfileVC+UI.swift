//
//  ProfileVC+UI.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import Foundation
import UIKit

// =====================================
// MARK: - UITableViewDataSource Methods
// =====================================
extension ProfileVC: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView:  UITableView, numberOfRowsInSection section: Int) -> Int {
        return UDManager.userPhotos?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell: PhotoCell = tblPhotos.dequeueReusableCell(for: indexPath)
        if let object = UDManager.userPhotos?[indexPath.row] {
            aCell.cellConfigh(with: object)
        }
        return aCell
    }
}
