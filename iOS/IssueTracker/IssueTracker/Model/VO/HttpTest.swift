//
//  HttpTest.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation
import Alamofire

struct HttpTest {
    
    func get() {
        AF.request("http://issue-tracker.cf/api/issues").responseDecodable { (response: DataResponse<IssueHTTPData, AFError>) in

            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct IssueHTTPData: Codable {
    let issues: [Issue]
    let result: Bool?
}
