//
//  BreakTimeDao.swift
//  UserDefaultsSample
//
//  Created by ueda seigo on 2018/11/28.
//  Copyright © 2018年 seigo ueda. All rights reserved.
//

import Foundation

struct BreakTimeDao: UserDefaultsDao {
    
    typealias Entity = BreakTime
    let key = "breakTime"
    
    func get() -> [BreakTime] {
        if let array = getArray() {
            return array
        }
        return [BreakTime]()
    }

    func set(breakTimes: [BreakTime]) {
        setArray(breakTimes)
    }
    
}

