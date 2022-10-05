//
//  HomeViewModel.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/08/06.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    struct Input {
        var viewDidLoad: Observable<Bool>
    }
    
    struct Output {
        var productImages: Driver<[UIImage]>
        var buttonTitles: Driver<[String]>
        var maketingImages: Driver<[UIImage]>
    }
    
    // MARK: - Variables
    private var productImages = BehaviorSubject<[UIImage]>(value: [])
    private var buttonTitles = PublishSubject<[String]>()
    private var maketingImages = BehaviorSubject<[UIImage]>(value: [])
    
    func binding(_ input: Input) -> Output {
        input.viewDidLoad
            .filter { $0 == true }
            .mapToVoid()
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                // 여행상품 이미지 설정
                self.productImages.onNext(self.fetchProductImages())
                
                // 버튼 타이틀 설정
                self.buttonTitles.onNext(self.fetchButtonTitles())
                
                // 마케팅 이미지 설정
                self.maketingImages.onNext(self.fetchMaketingImages())
            })
            .disposed(by: disposeBag)
        
        return makeOutput()
    }
    
    // MARK: - Private Methods
    private func makeOutput() -> Output {
        return Output(productImages: productImages.asDriverComplete(),
                      buttonTitles: buttonTitles.asDriverComplete(),
                      maketingImages: maketingImages.asDriverComplete())
    }
    
    private func fetchProductImages() -> [UIImage] {
        let sampleImages = [
            UIImage(named: "image_0001"),
            UIImage(named: "image_0002"),
            UIImage(named: "image_0003"),
            UIImage(named: "image_0004"),
            UIImage(named: "image_0005"),
        ]
        
        return sampleImages.compactMap { $0 }
    }
    
    private func fetchButtonTitles() -> [String] {
        let buttonTitles = [
            "국내\nMICE 리스트",
            "국내\n축제 리스트",
            "국내\n숙박 리스트",
            "무슬림\n국제 행사",
            "무슬림\n홍보영상",
            "국내\n식당 리스트"
        ]
        
        return buttonTitles
    }
    
    private func fetchMaketingImages() -> [UIImage] {
        let sampleImages = [
            UIImage(named: "image_0001"),
            UIImage(named: "image_0002"),
            UIImage(named: "image_0003"),
            UIImage(named: "image_0004"),
            UIImage(named: "image_0005"),
        ]
        
        return sampleImages.compactMap { $0 }
    }
}
