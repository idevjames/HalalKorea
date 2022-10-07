//
//  CompanyIntroduceDTO.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/07/16.
//

import Foundation
import Parse

class CompanyIntroduceModel: PFObject, PFSubclassing {
    /// table name 설정
    static func parseClassName() -> String {
        return "tb_company_introduce"
    }
    
    // 필드값 설정
    // self = PFObject (parse로 부터 들어오는 raw data의 key 값으로 내부 변수에 저장)
    var imageURL: String? {
        get { return self.object(forKey: "col_img_url") as? String }
    }
    
    var col_text: String? {
        get { return self.object(forKey: "col_text") as? String }
    }
}
