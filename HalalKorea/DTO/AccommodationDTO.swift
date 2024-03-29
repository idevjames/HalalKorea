//
//  AccommodationDTO.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/07/16.
//

import Foundation
import Parse

class AccommodationDTO: PFObject, PFSubclassing {
    /// table name 설정
    static func parseClassName() -> String {
        return "tb_accommodation"
    }
    
    func dd() -> String {
        return ""
    }
    
    // 필드값 설정
    // self = PFObject (parse로 부터 들어오는 raw data의 key 값으로 내부 변수에 저장)
    var contentID: String {
        get { return self.object(forKey: "col_contentid") as? String ?? "" }
    }
    
    var invisible: Bool {
        get { self.object(forKey: "col_invisible") as? Bool ?? false }
    }
    
    var title: String {
        get { self.object(forKey: "col_title") as? String ?? "" }
    }
    
    var overview: String {
        get { self.object(forKey: "col_overview") as? String ?? "" }
    }
    
    var createdTime: String {
        get { self.object(forKey: "col_createdtime") as? String ?? "" }
    }
    
    var modifiedTime: String {
        get { self.object(forKey: "col_modifiedtime") as? String ?? "" }
    }
    
    var imageURL1: String {
        get { self.object(forKey: "col_originimgurl1") as? String ?? "" }
    }
    
    var imageURL2: String {
        get { self.object(forKey: "col_originimgurl2") as? String ?? "" }
    }
    
    var imageURL3: String {
        get { self.object(forKey: "col_originimgurl3") as? String ?? "" }
    }
    
    var imageURL4: String {
        get { self.object(forKey: "col_originimgurl4") as? String ?? "" }
    }
    
    var imageURL5: String {
        get { self.object(forKey: "col_originimgurl5") as? String ?? "" }
    }
    
    var firstImageURL1: String {
        get { self.object(forKey: "col_firstimage") as? String ?? "" }
    }
    
    var firstImageURL2: String {
        get { self.object(forKey: "col_firstimage2") as? String ?? "" }
    }
    
    var mapPoint: PFGeoPoint {
        get { self.object(forKey: "col_mappoint") as? PFGeoPoint ?? PFGeoPoint(latitude: 0, longitude: 0) }
    }
    
    var mapx: Double {
        get { self.object(forKey: "col_mapx") as? Double ?? 0 }
    }
    
    var mapy: Double {
        get { self.object(forKey: "col_mapy") as? Double ?? 0 }
    }
    
    var checkin: String {
        get { self.object(forKey: "col_checkintime") as? String ?? "" }
    }
    
    var checkout: String {
        get { self.object(forKey: "col_checkouttime") as? String ?? "" }
    }
    
    var addr1: String {
        get { self.object(forKey: "col_add1") as? String ?? "" }
    }
    
    var telName: String {
        get { self.object(forKey: "col_telname") as? String ?? "" }
    }
    
    var tel: String {
        get { self.object(forKey: "col_tel") as? String ?? "" }
    }
    
    var homepage: String {
        get { self.object(forKey: "col_homepage") as? String ?? "" }
    }
    
    var reservation: String {
        get { self.object(forKey: "col_reservationlodging") as? String ?? "" }
    }
    
    var chkCooking: String {
        get { self.object(forKey: "col_chkcooking") as? String ?? "" }
    }
    
    var roomCount: String {
        get { self.object(forKey: "col_roomcount") as? String ?? "" }
    }
    
    var pickup: String {
        get { self.object(forKey: "col_pickup") as? String ?? "" }
    }
}
