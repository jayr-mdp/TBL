//
//  IdDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class IdDetails: NSObject, Codable  {
    public var name: String?
    public var value: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case value
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        //self.value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        //try container.encode(value, forKey: .value)
    }

}
