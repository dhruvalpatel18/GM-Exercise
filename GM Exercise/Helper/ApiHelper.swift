//
//  ApiHelper.swift
//  GM Exercise
//
//  Created by Dhruval Patel on 1/2/21.
//

import Foundation
import Alamofire

class ApiHelper {

    private let githubApiKey = "GitHub API URL"
    
    enum InfoPlistParser {
        static func getStringValue(forKey key: String) -> String {
            guard let value = Bundle.main.infoDictionary?[key] as? String else {
                fatalError("Could not find value for key \(key) in the Info.plist")
            }
            return value
        }
    }
    
    func fetchGitHubAPIResponse(completion: @escaping (Data) -> Void) {
        let url = URLRequest(url: NSURL(string: "\(InfoPlistParser.getStringValue(forKey: githubApiKey))")! as URL)

        AF.request(url).response { response in
            if let data = response.data {
                completion(data)
            }
        }
    }
}
