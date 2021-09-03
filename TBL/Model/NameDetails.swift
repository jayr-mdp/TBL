//
//  NameDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class NameDetails: NSObject, Codable  {
    public var title: String?
    public var first: String?
    public var last: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.first = try container.decode(String.self, forKey: .first)
        self.last = try container.decode(String.self, forKey: .last)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(first, forKey: .first)
        try container.encode(last, forKey: .last)
    }

}
