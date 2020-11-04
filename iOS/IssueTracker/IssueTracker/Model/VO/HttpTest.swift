//
//  HttpTest.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation
import Alamofire

protocol HTTPData {
    associatedtype DataType: Codable
    static var key: String { get }
}

struct IssueHTTPData<T: Codable & HTTPData>: Codable {

    private var data: T.DataType
    private var result: Bool

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(T.DataType.self, forKey: CodingKeys(stringValue: T.key))
        result = try container.decode(Bool.self, forKey: CodingKeys(stringValue: "result"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: CodingKeys(stringValue: T.key))
        try container.encode(result, forKey: CodingKeys(stringValue: "result"))
    }

    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init(stringValue: String) {
            self.stringValue = stringValue
        }
        init?(intValue: Int) {
            return nil
        }
    }
}

struct HttpTest {
    
    func get<T: Decodable>(
        url: URL,
        responseType: T.Type,
        completionHandler: ((T) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let data):
                completionHandler?(data)
            case .failure(let error):
                print(error)
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
