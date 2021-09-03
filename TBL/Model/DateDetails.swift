//
//  DateDetail.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class DateDetails: NSObject, Codable  {
    public var date: String?
    public var age: Int64?
    
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.age = try container.decode(Int64.self, forKey: .age)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(age, forKey: .age)
    }

}
