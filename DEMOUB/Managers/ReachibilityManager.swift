//
//  ReachibilityManager.swift
//  DEMOUB
//
//  Created by Neosoft on 24/03/24.
//

import Foundation
import Alamofire
struct NetworkReachabilityManagerService {
    
    private let networkManager = NetworkReachabilityManager()

    func isReachable()-> Bool {
         return networkManager?.isReachable == true
    }
}
