//
//  LoginDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class LoginDetails: NSObject, Codable  {
    public var uuid: String?
    public var username: String?
    public var password: String?
    public var salt: String?
    public var md5: String?
    public var sha1: String?
    public var sha256: String?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case username
        case password
        case salt
        case md5
        case sha1
        case sha256
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.salt = try container.decode(String.self, forKey: .salt)
        self.md5 = try container.decode(String.self, forKey: .md5)
        self.sha1 = try container.decode(String.self, forKey: .sha1)
        self.sha256 = try container.decode(String.self, forKey: .sha256)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(salt, forKey: .salt)
        try container.encode(md5, forKey: .md5)
        try container.encode(sha1, forKey: .sha1)
        try container.encode(sha256, forKey: .sha256)
    }

}
