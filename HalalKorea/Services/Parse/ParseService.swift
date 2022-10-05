//
//  ParseAPI.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/07/14.
//

import Foundation
import Parse

class ParseService {
    public static let shared = ParseService()
    
    private init() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = ParseConst.appID
            $0.clientKey = ParseConst.clientKey
            $0.server = ParseConst.server
        }
        
        Parse.initialize(with: configuration)
        
        // SubClassing 등록
        AccommodationDTO.registerSubclass()
    }
    
    // MARK: - Methods
    func fetchObjects<T>(completion: @escaping (Result<[T], Error>) -> Void) where T: PFObject {
        let query = T.query()
        
        query?.limit = 1
        query?.findObjectsInBackground { (objects, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let objects = objects as? [T] {
                completion(.success(objects))
            }
        }
    }
}
