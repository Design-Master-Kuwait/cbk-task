//
//  HomeVC+UI.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import Foundation
import UIKit

// =====================================
// MARK: - UITableViewDataSource Methods
// =====================================
extension HomeVC: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView:  UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFeed.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell: PostCell = tblPost.dequeueReusableCell(for: indexPath)
        aCell.cellConfig(with: arrFeed[indexPath.row])
        return aCell
    }
}
