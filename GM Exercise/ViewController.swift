//
//  ViewController.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiHelper().fetchGitHubAPIResponse(completion: { (data) in
            print(String(data: data, encoding: .utf8)!)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCell", for: indexPath) as! CommitCell
        cell.authorName.text = "Name \(indexPath.row)"
        cell.commitHash.text = "Hash \(indexPath.row)"
        cell.commitMessage.text = "Message \(indexPath.row)"
        
        return cell
    }

}

