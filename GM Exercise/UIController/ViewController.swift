//
//  ViewController.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import UIKit
import Toast_Swift

class ViewController: UITableViewController {

    private let vcHelper = VCHelper()
    private var commitList: [CommitModel]?
    private let noInternet = "No Internet"
    private let commitCellIdentifier = "CommitCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vcHelper.checkForReachability { [self] isInternetAvailable in
            if isInternetAvailable {
                commitList = vcHelper.commitList
                tableView.reloadData()
            } else {
                view.makeToast(noInternet, duration: 5.0, position: .top)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: commitCellIdentifier, for: indexPath) as! CommitCell
        
        if let commitArray = commitList {
            cell.authorName.text = commitArray[indexPath.row].author
            cell.commitHash.text = commitArray[indexPath.row].commitSha
            cell.commitMessage.text = commitArray[indexPath.row].commitMessage
        }

        return cell
    }

}

