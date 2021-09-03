//
//  InfoDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class InfoDetails: NSObject, Codable  {
    public var seed: String?
    public var results: Int64?
    public var page: Int64?
    public var version: String?
    
    enum CodingKeys: String, CodingKey {
        case seed
        case results
        case page
        case version
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seed = try container.decode(String.self, forKey: .seed)
        self.results = try container.decode(Int64.self, forKey: .results)
        self.page = try container.decode(Int64.self, forKey: .page)
        self.version = try container.decode(String.self, forKey: .version)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(seed, forKey: .seed)
        try container.encode(results, forKey: .results)
        try container.encode(page, forKey: .page)
        try container.encode(version, forKey: .version)
    }

}
