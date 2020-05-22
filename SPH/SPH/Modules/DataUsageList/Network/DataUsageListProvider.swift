//
//  DataUsageListProvider.swift
//  SPH
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Alamofire

protocol DataUsageListProviderProtocol {
    func getDataUsageList(completion: @escaping ([Record]?, AFError?) -> Void)
}

class DataUsageListProvider: DataUsageListProviderProtocol {
    
    func getDataUsageList(completion: @escaping ([Record]?, AFError?) -> Void) {
        let url = "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=59"
        
        let headers: [String: String] = [:]
        
        NetworkProvider.shared.request(url: url, type: .get, headers: headers, body: nil) { data, error  in
            if let error = error {
                AlertWireframe.shared.showOneButtonAlert("Error", message: error.localizedDescription, actionButton: "OK", inViewController: ApplicationCoordinator.shared.window.rootViewController)
                completion(nil, error)
                return
            }
            
            
            if let data = data, let baseModel = try? JSONDecoder().decode(BaseModel<DataUsageList>.self, from: data) {
                completion(baseModel.result?.records, nil)
                return
            }
        }
    }
}
