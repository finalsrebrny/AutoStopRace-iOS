//
//  CreateLocationRecordRequest.swift
//  Auto Stop Race
//
//  Created by Robert Ignasiak on 30.03.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import RealmSwift

class CreateLocationRecordRequest: Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var message: String = ""
    @objc dynamic var image: String = ""
    
    func toDictionary() -> [String: [String: Any] ] {
        let dictionary = ["location":
            [
            "latitude": self.latitude,
            "longitude": self.longitude,
            "message": self.message,
            "image": self.image
            ]]
        return dictionary
    }
}
