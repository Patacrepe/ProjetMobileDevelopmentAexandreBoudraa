//
//  RequestFactory.swift
//  ProjetBoudraa
//
//  Created by goldorak on 14/02/2022.
//

import Foundation
import UIKit
import SwiftUI

protocol RequestEventProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params:
[String]?) -> URLRequest
    func getFurnitureList(callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Furniture]?) -> Void)
   
}

private let furnitureUrlStr = "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule"

class RequestEvent: RequestEventProtocol {
    internal func createRequest(urlStr: String, requestType: RequestType,
     params: [String]?) -> URLRequest {
        var url: URL = URL(string: urlStr)!
        if let params = params {
            var urlParams = urlStr
            for param in params {
                urlParams = urlParams + "/" + param
            }
            print(urlParams)
            url = URL(string: urlParams)!
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = requestType.rawValue
        let accessToken = "keynCaByVYige2Wsy"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField:
         "Authorization")
        return request
}
    func getFurnitureList(callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Furniture]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: furnitureUrlStr, requestType: .get,                                                        params: nil)) { (data, response, error) in
if let data = data, error == nil {
    if let responseHttp = response as? HTTPURLResponse {
        if responseHttp.statusCode == 200 {
            if let response = try?
             JSONDecoder().decode(Records.self, from: data) {
                callback((nil, nil), response.records)
}
else {
                callback((CustomError.parsingError, "parsing error"), nil)
} }

                else {
                    callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                }
} }
        else {
            callback((CustomError.requestError,
             error.debugDescription), nil)
        }
}
    task.resume()
}
}

