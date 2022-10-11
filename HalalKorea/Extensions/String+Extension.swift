//
//  String+Extension.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/11.
//

import Foundation

extension String {
    func withoutHtml() -> String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
          
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
            
        } catch {
            return self
        }
    }
}
