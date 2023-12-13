//
//  NetworkService.swift
//  Test_CollectionView_UIKit
//
//  Created by Александра Макей on 13.12.2023.
//

import Foundation

class NetworkService: NetworkServiceProtocol {

    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            guard let data = data else {
                completion(nil, NSError(domain: "Invalid Data", code: -2, userInfo: nil))
                return
            }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                completion(users, nil)
            } catch {
                completion(nil, NSError(domain: "Parsing Data error", code: -3, userInfo: nil) )
            }
        }
        task.resume()
    }
}
