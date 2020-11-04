//
//  NetworkTest.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/03.
//

import Foundation
import Alamofire

struct HTTPServiceHelper {
    
    static let shared = HTTPServiceHelper()
    
    private init() {}
    
    func get<T: Codable & HTTPDataProviding>(
        url: URL,
        responseType: T.Type,
        completionHandler: ((T.DataType) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                completionHandler?(httpData.data as T.DataType)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
    
    func put() {
        
    }
    
    func post() {
        
    }
    
    func delete() {
        
    }
}
