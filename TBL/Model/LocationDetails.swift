//
//  LocationDetails.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class Street: NSObject, Codable  {
    public var name: String?
    public var number: Int64?
    
    enum CodingKeys: String, CodingKey {
        case name
        case number
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.number = try container.decode(Int64.self, forKey: .number)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(number, forKey: .number)
    }

}

class Coordinates: NSObject, Codable  {
    public var latitude: String?
    public var longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}

class Timezone: NSObject, Codable  {
    public var offset: String?
    public var timezoneDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try container.decode(String.self, forKey: .offset)
        self.timezoneDescription = try container.decode(String.self, forKey: .timezoneDescription)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(offset, forKey: .offset)
        try container.encode(timezoneDescription, forKey: .timezoneDescription)
    }

}

class LocationDetails: NSObject, Codable  {
    public var street: Street?
    public var city: String?
    public var state: String?
    public var country: String?
    public var postcode: String?
    public var coordinates: Coordinates?
    public var timezone: Timezone?
    
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
        case postcode
        case coordinates
        case timezone
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(Street.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.country = try container.decode(String.self, forKey: .country)
        self.postcode =  ""
        if let stringProperty = try? container.decode(String.self, forKey: .postcode) {
            self.postcode = stringProperty
        } else if let intProperty = try? container.decode(Int64.self, forKey: .postcode) {
            self.postcode = String(intProperty)
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
        }
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        self.timezone = try container.decode(Timezone.self, forKey: .timezone)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
        try container.encode(postcode, forKey: .postcode)
        try container.encode(coordinates, forKey: .coordinates)
        try container.encode(timezone, forKey: .timezone)
    }

}
