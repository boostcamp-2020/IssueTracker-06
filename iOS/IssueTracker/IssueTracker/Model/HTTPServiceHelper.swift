//
//  HTTPServiceHelper.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation
import Alamofire

struct HTTPServiceHelper {

    static let shared = HTTPServiceHelper()

    private init() {}

    func get<T: Codable & HTTPDataProviding>(
        url: URL,
        responseType: T.Type,
        completionHandler: ((T.DataType?) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                completionHandler?((httpData.data))
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }

    func put() {

    }

    func post() {
        
    }

    func delete<T: Codable & HTTPDataProviding>(
        url: URL,
        responseType: T.Type,
        completionHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .delete).responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                completionHandler?(httpData.result)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
}
