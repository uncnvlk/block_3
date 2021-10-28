

import Foundation

// MARK: - FriendsJSON
struct FriendsJSON: Codable {
    let response: ResponseFr
}

// MARK: - Response
struct ResponseFr: Codable {
    let count: Int
    let items: [FriendModels]
}

// MARK: - Item
struct FriendModels: Codable {
    let id: Int
    let lastName: String
    let photo50: String
    let trackCode, firstName: String
    let photo100: String

    var fullName: String {
        firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
