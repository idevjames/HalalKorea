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
        AccommodationModel.registerSubclass()
    }
    
    // MARK: - Methods
    /**
     Parse 서버에서 Generic<T>로 설정된 타입의 데이터를 가져온다
     - Parameters:
        - startIndex: 데이터를 가져올 인덱스의 시작 순서
        - count: 가져올 데이터의 개수
        - completion: Result<[T], Error>
     */
    func fetchObjects<T>(startIndex: Int = 0, count: Int = 10, completion: @escaping (Result<[T], Error>) -> Void) where T: PFObject {
        let query = T.query()
        
        query?.skip = startIndex
        query?.limit = count
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
