//
//  MiceTourModel.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/01.
//

import Foundation
import Parse

class MiceTourModel: PFObject, PFSubclassing {
    /// table name 설정
    static func parseClassName() -> String {
        return "tb_mice"
    }
    
    // 필드값 설정
    // self = PFObject (parse로 부터 들어오는 raw data의 key 값으로 내부 변수에 저장)
    var category: String {
        get { return self.object(forKey: "col_mice_category") as? String ?? "" }
    }
    
    var name: String {
        get { return self.object(forKey: "col_mice_name") as? String ?? "" }
    }
    
    var duration: String {
        get { return self.object(forKey: "col_mice_duration") as? String ?? "" }
    }
    
    var location: String {
        get { return self.object(forKey: "col_mice_location") as? String ?? "" }
    }
    
    var detail: String {
        get { return self.object(forKey: "col_mice_detail") as? String ?? "" }
    }
    
    var payment: String {
        get { return self.object(forKey: "col_mice_payment") as? String ?? "" }
    }
    
    var contact: String {
        get { return self.object(forKey: "col_mice_contact") as? String ?? "" }
    }
    
    var imageURL1: String {
        get { return self.object(forKey: "col_mice_img_url1") as? String ?? "" }
    }
    
    var imageURL2: String {
        get { return self.object(forKey: "col_mice_img_url2") as? String ?? "" }
    }
    
    var imageURL3: String {
        get { return self.object(forKey: "col_mice_img_url3") as? String ?? "" }
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
                image: Asset.Images.icDet6.image,
                title: "Location",
                content: location
            )
        )
        
        contents.append(
            DetailContent(
                image: Asset.Images.icDet1.image,
                title: "Duration",
                content: duration
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
                content: payment
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
