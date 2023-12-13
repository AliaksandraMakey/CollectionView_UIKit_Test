//
//  Address.swift
//  Test_CollectionView_UIKit
//
//  Created by Александра Макей on 13.12.2023.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
