//
//  ViewController.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import UIKit

class ViewController: UITableViewController {

    let vcHelper = VCHelper()
    var commitList: [CommitModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiHelper().fetchGitHubAPIResponse(completion: { [self] (data) in
            vcHelper.parseJsonResponse(data: data)
            commitList = vcHelper.commitList
            tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCell", for: indexPath) as! CommitCell
        cell.authorName.text = vcHelper.commitList[indexPath.row].author
        cell.commitHash.text = vcHelper.commitList[indexPath.row].commitSha
        cell.commitMessage.text = vcHelper.commitList[indexPath.row].commitMessage
        
        return cell
    }

}

