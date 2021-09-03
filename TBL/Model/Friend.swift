//
//  Friend.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class Result : NSObject, Codable  {
    public var results: Array<Friend>?
    public var info: InfoDetails?
    
    enum CodingKeys: String, CodingKey {
        case results
        case info
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode(Array.self, forKey: .results)
        self.info = try container.decode(InfoDetails.self, forKey: .info)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
        try container.encode(info, forKey: .info)
    }
}

class Friend: NSObject, Codable {
    public var gender: String?
    public var name: NameDetails?
    public var location: LocationDetails?
    public var email: String?
    public var login: LoginDetails?
    public var dob: DateDetails?
    public var registered: DateDetails?
    public var phone: String?
    public var cell: String?
    //public var friendId: IdDetails?
    public var picture: PictureDetails?
    public var nat: String?
    
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case friendId = "id"
        case picture
        case nat
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.name = try container.decode(NameDetails.self, forKey: .name)
        self.location = try container.decode(LocationDetails.self, forKey: .location)
        self.email = try container.decode(String.self, forKey: .email)
        self.login = try container.decode(LoginDetails.self, forKey: .login)
        self.dob = try container.decode(DateDetails.self, forKey: .dob)
        self.registered = try container.decode(DateDetails.self, forKey: .registered)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.cell = try container.decode(String.self, forKey: .cell)
        //self.friendId = try container.decode(IdDetails.self, forKey: .friendId)
        self.picture = try container.decode(PictureDetails.self, forKey: .picture)
        self.nat = try container.decode(String.self, forKey: .nat)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gender, forKey: .gender)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(email, forKey: .email)
        try container.encode(login, forKey: .login)
        try container.encode(dob, forKey: .dob)
        try container.encode(registered, forKey: .registered)
        try container.encode(phone, forKey: .phone)
        try container.encode(cell, forKey: .cell)
        //try container.encode(friendId, forKey: .friendId)
        try container.encode(picture, forKey: .picture)
        try container.encode(nat, forKey: .nat)
    }
}
