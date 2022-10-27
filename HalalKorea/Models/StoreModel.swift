//
//  StoreModel.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/26.
//

import Foundation
import Parse

class StoreModel: PFObject, PFSubclassing {
    /// table name 설정
    static func parseClassName() -> String {
        return "tb_store"
    }
    
    // 필드값 설정
    // self = PFObject (parse로 부터 들어오는 raw data의 key 값으로 내부 변수에 저장)
    var category: String {
        get { return self.object(forKey: "col_store_category") as? String ?? "" }
    }
    var name: String {
        get { return self.object(forKey: "col_store_name") as? String ?? "" }
    }
    
    var homepage: String {
        get { return self.object(forKey: "col_store_homepage") as? String ?? "" }
    }
    
    var price: String {
        get { return self.object(forKey: "col_store_price") as? String ?? "" }
    }
    
    var detail: String {
        get { return self.object(forKey: "col_store_detail") as? String ?? "" }
    }
    
    var manufacturer: String {
        get { return self.object(forKey: "col_store_manufacturer") as? String ?? "" }
    }
    
    var contact: String {
        get { return self.object(forKey: "col_store_contact") as? String ?? "" }
    }
    
    var imageURL1: String {
        get { return self.object(forKey: "col_store_img_url1") as? String ?? "" }
    }
    
    var imageURL2: String {
        get { return self.object(forKey: "col_store_img_url2") as? String ?? "" }
    }
    
    var imageURL3: String {
        get { return self.object(forKey: "col_store_img_url3") as? String ?? "" }
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
                image: Asset.Images.icShopGuide.image,
                title: "Manufacturer",
                content: manufacturer
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet8.image,
                title: "Contact",
                content: contact
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet4.image,
                title: "Price",
                content: price
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet88.image,
                title: "Homepage",
                content: homepage
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet5.image.withTintColor(.systemIndigo),
                title: "Detail",
                content: detail
            )
        )
        
        return contents
    }
}
