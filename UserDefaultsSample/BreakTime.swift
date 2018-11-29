//
//  BreakTime.swift
//  UserDefaultsSample
//
//  Created by ueda seigo on 2018/11/28.
//  Copyright © 2018年 seigo ueda. All rights reserved.
//

import Foundation

struct BreakTime: UserDefaultsEntity {
    
    var id = ""
    var time = Double(0)
    
    init() {
    }
    
    mutating func setProperty(label: String, element: Any) {
        switch label {
        case "id":
            id = element as? String ?? ""
            
        case "time":
            time = Double(element as? String ?? "0") ?? 0
            
        default:
            break
        }
    }
    
}
