//
//  BTGObjectMapper.swift
//  GenericMapper
//
//  Created by Gabriel vieira on 8/13/17.
//  Copyright © 2017 Gabriel vieira. All rights reserved.
//

import Foundation
import ObjectMapper

struct Temperature: Mappable {
    var celsius: Double?
    var fahrenheit: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        celsius 	<- map["celsius"]
        fahrenheit 	<- map["fahrenheit"]
    }
}

class GenericObjectMapper {

    class func withJson<T: Mappable>(jsonString: String, ofType: T.Type) -> T? {
        return mapJson(model: T.self, jsonString: jsonString)
    }
    
    class func withJsonFile<T: Mappable>(fileName: String, ofType: T.Type) -> T? {
        if  let jsonFromFile = readJson(fileName: fileName) {
            return mapJson(model: T.self, jsonString: jsonFromFile)
        }
        return nil
    }
    
    private class func readJson(fileName: String) -> String? {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let jsonString = String.init(data: data, encoding: .utf8)
                return jsonString
                
            } else {
                print("no file")
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private class func mapJson<T: Mappable>(model: T.Type, jsonString: String) -> T? {
        return  Mapper<T>().map(JSONString: jsonString)
    }
}
