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
        successHandler: ((T.DataType?) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let request = try? URLRequest(url: url, method: .get) else { return }
        AF.request(request).responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                successHandler?(httpData.data)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
    
    func put<T: Codable & HTTPDataProviding>(
        url: URL,
        body: T,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .put, parameters: body)
            .responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                successHandler?(httpData.result)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
    
    func post<T: Codable & HTTPDataProviding>(
        url: URL,
        body: T,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .post, parameters: body)
            .responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                successHandler?(httpData.result)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
  
    func delete<T: Codable & HTTPDataProviding>(
        url: URL,
        requestType: T.Type,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .delete).responseDecodable { (response: AFDataResponse<HTTPData<T>>) in
            switch response.result {
            case .success(let httpData):
                successHandler?((httpData.result))
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
}
