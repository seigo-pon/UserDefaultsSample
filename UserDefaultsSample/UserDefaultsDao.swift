//
//  UserDefaultsDao.swift
//  UserDefaultsSample
//
//  Created by ueda seigo on 2018/11/28.
//  Copyright © 2018年 seigo ueda. All rights reserved.
//

import Foundation

protocol UserDefaultsDao {
    
    associatedtype Entity: UserDefaultsEntity
    
    var key: String { get }
    
}

extension UserDefaultsDao {
    
    func getValue() -> Entity? {
        if let dict = UserDefaults.standard.value(forKey: key) as? NSDictionary,
            let value = dict as? [String: Any] {
            return Entity(value: value)
        }
        return nil
    }
    
    func setValue(_ value: Entity) {
        UserDefaults.standard.set(NSDictionary(dictionary: value.parse()), forKey: key)
    }
    
    func getArray() -> [Entity]? {
        if let array = UserDefaults.standard.value(forKey: key) as? NSArray,
            let value = array as? [[String: Any]] {
            return value.map { Entity(value: $0) }
        }
        return nil
    }
    
    func setArray(_ value: [Entity]) {
        let array = value.map { $0.parse() }
        UserDefaults.standard.set(NSArray(array: array), forKey: key)
    }
    
}
