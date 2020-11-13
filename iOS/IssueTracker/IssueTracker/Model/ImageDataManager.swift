//
//  ImageDataManager.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/13.
//

import Foundation

struct ImageDataManager {
    
    func get(
        id: Int,
        successHandler: ((String) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        
        let imageName = "\((id % 5) == 0 ? 5 : (id % 5))"
        successHandler?(imageName)
    }
}
