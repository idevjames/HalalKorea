//
//  LunchBoxModel.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/17.
//

import Foundation
import Parse

class LunchBoxModel: PFObject, PFSubclassing {
    /// table name 설정
    static func parseClassName() -> String {
        return "tb_lunchbox"
    }
    
    // 필드값 설정
    // self = PFObject (parse로 부터 들어오는 raw data의 key 값으로 내부 변수에 저장)
    
    var imageURL1: String {
        get { self.object(forKey: "col_lunch_img_url1") as? String ?? "" }
    }
    
    var imageURL2: String {
        get { self.object(forKey: "col_lunch_img_url2") as? String ?? "" }
    }
    
    var imageURL3: String {
        get { self.object(forKey: "col_lunch_img_url3") as? String ?? "" }
    }
    
    var menu: String {
        get { return self.object(forKey: "col_lunch_menu") as? String ?? "" }
    }
    
    var detail: String {
        get { return self.object(forKey: "col_lunch_detail") as? String ?? "" }
    }
    
    var category: String {
        get { return self.object(forKey: "col_lunch_category") as? String ?? "" }
    }
    
    var price: String {
        get { return self.object(forKey: "col_lunch_price") as? String ?? "" }
    }
    
    var lunchName: String {
        get { return self.object(forKey: "col_lunch_name") as? String ?? "" }
    }
    
    var mainImage: URL? {
        let imageURLs = [imageURL1, imageURL2, imageURL3]
        
        for imageURL in imageURLs {
            if !imageURL.isEmpty, let url = URL(string: imageURL) {
                return url
            }
        }
        
        return nil
    }
    
    var contents: [DetailContent] {
        var contents = [DetailContent]()
        
        contents.append(
            DetailContent(
                image: Asset.Images.icFoodMenu.image,
                title: "Menu",
                content: menu
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.visibleOn.image.withTintColor(.black),
                title: "Category",
                content: category
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet5.image,
                title: "Detail",
                content: detail
            )
        )
        
        
        return contents
    }
}
