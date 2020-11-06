//
//  NetworkTest.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/03.
//

import Foundation
import Alamofire

struct HttpTest {
    
    func get() {
        AF.request("http://issue-tracker.cf/api/issue/1").responseDecodable { (response: DataResponse<IssueHTTPData, AFError>) in

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
    let issue: Issue
    let result: Bool
}
