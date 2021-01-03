//
//  CommitModel.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import Foundation

struct CommitModel {
    var author: String
    var commitSha: String
    var commitMessage: String
    
    init(author: String, sha: String, message: String) {
        self.author = author
        self.commitSha = sha
        self.commitMessage = message
    }
}
