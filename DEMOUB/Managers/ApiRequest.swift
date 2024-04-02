//
//  NetworkManager.swift
//  DEMOUB
//
//  Created by Neosoft on 24/03/24.
//

import Foundation
import Alamofire
protocol APIRequest {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var apiKey: String {get}
    var method: HTTPMethod { get }
 
    
}

extension APIRequest {
    var baseURL: String { "" }
    var path: String { "" }
    var headers: HTTPHeaders { [:] }
    var apiKey: String {""}
    var method: HTTPMethod { .get }
    
 }
