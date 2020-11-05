//
//  HTTPData.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

protocol HTTPDataProviding {
    associatedtype DataType: Codable
    static var key: String { get }
}

struct HTTPData<T: Codable & HTTPDataProviding>: Codable {
  
    let data: T.DataType?
    let result: Bool

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decode(T.DataType.self, forKey: CodingKeys(stringValue: T.key))
        result = try container.decode(Bool.self, forKey: CodingKeys(stringValue: Key.result.rawValue))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: CodingKeys(stringValue: T.key))
        try container.encode(result, forKey: CodingKeys(stringValue: Key.result.rawValue))
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

    private enum Key: String {
        case result
    }
}
