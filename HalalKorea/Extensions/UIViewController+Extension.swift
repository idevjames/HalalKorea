//
//  UIViewController+Extension.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/06.
//

import UIKit

extension UIViewController {
    func setNavigationTitleView() -> UIView {
        let imageView = UIImageView(
            image: Asset.Images.homeHalalLogo.image
        )
        
        imageView.image?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
}
