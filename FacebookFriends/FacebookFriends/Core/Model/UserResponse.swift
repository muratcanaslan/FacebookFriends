//
//  Friend.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import Foundation

struct UsersResponse: Decodable {
    var results: [User]?
}

struct User: Decodable {
    let gender: Gender?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let phone: String?
    let nat: String?
    let picture: Picture?
    
    enum Gender: String, CodingKey, Decodable {
        case female = "female"
        case male = "male"
    }
    
    struct Name: Decodable {
        var title: String?
        var last: String?
        var first: String?
    }
    
    struct Location: Decodable {
        var city: String?
        var state: String?
        var country: String?
        var coordinates: Coordinates?
        
    }
    
    struct Coordinates: Decodable {
        var latitude: String?
        var longitude: String?
    }
    
    struct Login: Decodable {
        var username: String?
    }
    
    struct Picture: Decodable {
        var large: URL?
        var medium: URL?
        var thumbnail: URL?
    }
}
