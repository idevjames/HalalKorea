//
//  ObservableType+Extension.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/08/09.
//

import RxCocoa
import RxSwift

extension ObservableType {
    
    func asDriverComplete() -> SharedSequence<DriverSharingStrategy, Element> {
        return asDriver(onErrorRecover: { error in
            return Driver.empty()
        })
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
