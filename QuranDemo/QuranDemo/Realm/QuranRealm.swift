//
//  QuranRealm.swift
//  QuranDemo
//
//  Created by iMac on 16/03/21.
//

import UIKit
import Realm
import RealmSwift

class QuranRealm: Object {
    @objc dynamic var id = 1
    @objc dynamic var surah = ""
    @objc dynamic var ayah = ""
    @objc dynamic var title = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
