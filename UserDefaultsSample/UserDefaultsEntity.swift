//
//  UserDefaultsEntity.swift
//  UserDefaultsSample
//
//  Created by ueda seigo on 2018/11/28.
//  Copyright © 2018年 seigo ueda. All rights reserved.
//

import Foundation

protocol UserDefaultsEntity {
    
    init()
    mutating func setProperty(label: String, element: Any)
    
}

extension UserDefaultsEntity {
    
    init(value: [String: Any]) {
        self.init()
        self.merge(value: value)
    }
    
    mutating func merge(value: [String: Any]) {
        for case let (label?, _) in Mirror(reflecting: self).children {
            guard let element = value[label] else {
                continue
            }
            setProperty(label: label, element: element)
        }
    }
    
    func parse() -> [String: Any] {
        var result = [String: Any]()
        
        for case let (label?, value) in Mirror(reflecting: self).children {
            switch value {
            case let value as UserDefaultsEntity:
                result[label] = value.parse()
                
            case let value as [UserDefaultsEntity]:
                result[label] = value.map { $0.parse() }
                
            case let value as Int:
                result[label] = "\(value)"
                
            case let value as Double:
                result[label] = "\(value)"

            default:
                result[label] = value
            }
        }
        
        return result
    }
    
}
