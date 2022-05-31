//
//  URLProvider.swift
//  
//
//  Created by Wattpad Cuong on 2022-05-31.
//

import Foundation

fileprivate struct Constants {
    static let baseURL = "www.wattpad.com"
    static let https = "https"
    static let version3 = "v3"
    static var stories: String {
        return "/api/\(Constants.version3)/stories"
    }
    static var users: String {
        return "/api/\(Constants.version3)/users"
    }
    static func user(withID id: Int) -> String {
        return "/api/\(Constants.version3)/\(id)"
    }
}

fileprivate struct Params {
    static let zero = "0"
    static let id = "id"
}

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]
    
    var url: URL? {
        var componentURL = URLComponents()
        componentURL.scheme = Constants.https
        componentURL.host = Constants.baseURL
        componentURL.path = path
        componentURL.queryItems = queryItems
        
        return componentURL.url
    }
}

// Stories
extension Endpoint {
    static func getStoriesEndpoint(withOffset offset: String = Params.zero,
                                   limit: String = "10",
                                   fields: String = "stories(\(Params.id),title,cover,user)",
                                   filter: String = "new") -> Endpoint {
        return Endpoint(path: Constants.stories,
                        queryItems: [
                        URLQueryItem(name: "offset", value: offset),
                        URLQueryItem(name: "limit", value: limit),
                        URLQueryItem(name: "fields", value: fields),
                        URLQueryItem(name: "filter", value: filter)
                        ])
    }
}
