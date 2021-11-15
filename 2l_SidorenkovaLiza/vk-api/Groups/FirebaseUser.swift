import Firebase
import Foundation

class FirebaseUser {
    let id: String
    var groups: [String]?
    let ref: DatabaseReference?

    init(id: String) {
        self.id = id
        self.ref = nil
        self.groups = nil
    }

    init(id: String, groups: [String]) {
        self.id = id
        self.groups = groups
        self.ref = nil
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String : Any],
              let id = value["id"] as? String,
              let groups = value["groups"] as? [String]
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.id = id
        self.groups = groups
    }

    func toAnyObject() -> [AnyHashable: Any] {
        return ["id": id,
                "groups": [groups]] as [AnyHashable: Any]
    }

    func addGroup(group: String) {
        self.groups?.append(group)
    }
}
