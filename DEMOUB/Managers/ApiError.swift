//
//  ApiError.swift
//  DEMOUB
//
//  Created by Neosoft on 24/03/24.
//

import Foundation
enum APIError: Error, LocalizedError {
    case noInternet
    case invalidURL
    case unknownStatusCode(error: String? = nil)
    case unknown
    case apiError(reason: String)
   
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return "Please check your internet connection"
        case .invalidURL:
            return "Invalid URL"
        case .unknownStatusCode(let error):
            return "Invalid Status Code" + (error ?? "")
        case .unknown:
            return "Unknown error"
       
        case .apiError(let reason):
            return reason
        }
    }
}
