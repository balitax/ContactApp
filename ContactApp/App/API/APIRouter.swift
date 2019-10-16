//
//  APIRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Alamofire

enum APIRouter: APIConfiguration {
    case listContact
    
    var baseURL: URL {
        switch self {
        case .listContact:
            guard let url = URL(string: EnvironmentURL.baseURL) else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .listContact:
            return [
                HTTPHeaderField.contentType.rawValue: ContentType.form.rawValue,
                HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listContact:
            return .get
        }
    }
    
    
    var path: String {
        switch self {
        case .listContact:
            return "contacts.json"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    var multipartFormData: (MultipartFormData) -> Void {
        switch self {
        default:
            return { multipartFormData in
            }
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        headers?.forEach({ (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
        return try parameterEncoding.encode(urlRequest, with: parameters)
    }
    
}
