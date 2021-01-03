//
//  VCHelper.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import Foundation
import Alamofire

class VCHelper {
    
    public private(set) var commitList = [CommitModel]()
    
    func parseJsonResponse(data: Data) {
        var authorName = ""
        var commitSha = ""
        var commitMessage = ""
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for obj in jsonArray {
                    if let sha = obj["sha"] as? String {
                        commitSha = sha
                    }
                    if let commit = obj["commit"] as? [String: Any] {
                        if let message = commit["message"] as? String {
                            commitMessage = message
                        }
                        if let author = commit["author"] as? [String: Any] {
                            if let name = author["name"] as? String {
                                authorName = name
                            }
                        }
                    }
                    commitList.append(CommitModel(author: authorName, sha: commitSha, message: commitMessage))
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
}
