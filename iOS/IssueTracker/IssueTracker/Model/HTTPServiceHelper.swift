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
    
    func put<T: Codable>(
        url: URL,
        body: T,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .put, parameters: body)
            .responseDecodable { (response: AFDataResponse<HTTPResponseData>) in
            switch response.result {
            case .success(let httpData):
                successHandler?(httpData.result)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
    
    func patch<T: Codable>(
        url: URL,
        body: T,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .patch, parameters: body)
            .responseDecodable { (response: AFDataResponse<HTTPResponseData>) in
            switch response.result {
            case .success(let httpData):
                successHandler?(httpData.result)
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
    
    // api에서 post response로 result: Bool, ()Id: String? 이 오기때문에 responseKeyID를 매개변수로 추가함
    func post<T: Codable>(
        url: URL,
        body: T,
        responseKeyID: String,
        successHandler: (((result: Bool, id: Int?)) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        HTTPResponseData.keyID = responseKeyID
        AF.request(url, method: .post, parameters: body)
            .responseDecodable { (response: AFDataResponse<HTTPResponseData>) in
            switch response.result {
            case .success(let httpData):
                successHandler?((result: httpData.result, id: httpData.id))
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
      
    func delete<T: Codable>(
        url: URL,
        requestType: T.Type,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        AF.request(url, method: .delete).responseDecodable { (response: AFDataResponse<HTTPResponseData>) in
            switch response.result {
            case .success(let httpData):
                successHandler?((httpData.result))
            case .failure(let error):
                errorHandler?(error)
            }
        }
    }
}
