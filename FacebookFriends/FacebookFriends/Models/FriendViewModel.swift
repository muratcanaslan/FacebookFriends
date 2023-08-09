//
//  FriendViewModel.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import Foundation

struct FriendViewModel {
    let gender: User.Gender?
    let fullname: String
    let location: User.Location?
    let email: String
    let username: String
    let phone: String
    let nation: String
    let picture: User.Picture?
    
    init(model: User? = nil) {
        self.gender = model?.gender
        self.fullname = "\(model?.name?.title ?? "") \(model?.name?.first ?? "") \(model?.name?.last ?? "")"
        self.location = model?.location
        self.email = model?.email ?? "-"
        self.username = model?.login?.username ?? "-"
        self.phone = model?.phone ?? "-"
        self.nation = model?.nat ?? "-"
        self.picture = model?.picture
    }
    
    var locationString: String {
        return "\(location?.city ?? "-")/\(location?.country ?? "-")"
    }
    
    var longitude: Double {
        return Double(location?.coordinates?.longitude ?? "") ?? 0.0
    }
    
    var latitude: Double {
        return Double(location?.coordinates?.latitude ?? "") ?? 0.0
    }
}
