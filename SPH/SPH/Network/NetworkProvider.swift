//
//  NetworkProvider.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Alamofire

class NetworkProvider {
    static var shared = NetworkProvider()
    
    typealias JSON = [String: Any]
    
    func request(url: String, type: HTTPMethod, headers: [String: String], body: [String: Any]?, completion: @escaping (JSON?, AFError?) -> Void) {
        
        if !ReachabilityManager.shared.hasConnection {
            AlertWireframe.shared.showNoInternetConnectionAlert(inViewController: ApplicationCoordinator.shared.window.rootViewController)
            return
        }
        
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 60
        
        let httpHeaders = HTTPHeaders(headers)
        request.headers = httpHeaders
        
        if let body = body {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        
        AF.request(request)
            .validate()
            .responseJSON(completionHandler: { (response) in
                
                print("DEBUGD: \(response)")
                
                switch response.result {
                case .failure(let error):
                    completion(nil, error)
                case .success(let value):
                    let json = value as! JSON
                    completion(json, nil)
                }
        })
    }
}
