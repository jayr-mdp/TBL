//
//  PictureDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class PictureDetails: NSObject, Codable  {
    public var large: String?
    public var medium: String?
    public var thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.large = try container.decode(String.self, forKey: .large)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(large, forKey: .large)
        try container.encode(medium, forKey: .medium)
        try container.encode(thumbnail, forKey: .thumbnail)
    }
}
