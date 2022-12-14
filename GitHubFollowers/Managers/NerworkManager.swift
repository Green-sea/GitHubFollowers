//
//  NerworkManager.swift
//  GitHubFollowers
//
//  Created by Ya on 14.12.22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int,
                      completed: @escaping([Follower]?, String?) -> Void) {
        let endPoint = baseUrl + username + "/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, "This userName created an invalid reauest. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response form the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received form the server was invalid. Please try again")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil) 
            } catch {
                completed(nil, "The data received form the server was invalid. Please try again")
            }
        }
        
        task.resume()
    }
}
