//
//  NetworkServiceProtocol.swift
//  Test_CollectionView_UIKit
//
//  Created by Александра Макей on 13.12.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void)
}
