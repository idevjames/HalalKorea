//
//  StoreListViewModel.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/26.
//

import Foundation

import RxSwift
import RxCocoa

class StoreListViewModel {
    struct Input {
        let didLoad: Observable<Void>
        let itemSelected: ControlEvent<IndexPath>
        let loadMore: Observable<Bool>
    }
    
    struct Output {
        var models = BehaviorRelay<[StoreModel]>(value: [])
        var selected = PublishSubject<StoreModel>()
    }
    
    // MARK: - Variables
    var type: String = ""
    private let disposeBag = DisposeBag()
    private var models = BehaviorRelay<[StoreModel]>(value: [])
    private var selectedModel = PublishSubject<StoreModel>()
    private var startIndex: Int = 0
    private let fetchingCount: Int = 10
    private var isLoading: Bool = false

    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        input.didLoad
            .flatMap { [weak self] in self!.fetch() }
            .subscribe { [weak self] newModels in
                guard let self = self else { return }
                
                self.models.accept(self.models.value + newModels)
                self.startIndex = newModels.count
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        input.itemSelected
            .compactMap { self.models.value[$0.row] }
            .bind(to: self.selectedModel)
            .disposed(by: disposeBag)
        
        input.loadMore
            .filter { $0 && !self.isLoading }
            .flatMap { [weak self] _ in self!.fetch() }
            .subscribe(onNext: { [weak self] newModels in
                guard let self = self else { return }
                
                self.models.accept(self.models.value + newModels)
                self.startIndex = newModels.count
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)

        return Output(models: self.models,
                      selected: self.selectedModel)
    }
    
    // MARK: - Private Methods
    private func fetch() -> Observable<[StoreModel]> {
        self.isLoading = true
        print("## Store Fetching Parse Object")
        
        return Observable.create { emitter in
            
            ParseService.shared.fetchObjects(startIndex: self.startIndex,
                                             count: self.fetchingCount,
                                             compareColumn: "col_store_category",
                                             compareValue: self.type) { (result: Result<[StoreModel], Error>) in
                switch result {
                case .success(let models):
                    emitter.onNext(models)
                    print("### Fetching Data Count: \(models.count)")
                    
                case .failure(let error):
                    print("### Fetching Data Error: \(error.localizedDescription)")
                    emitter.onError(error)
                }
                
                self.isLoading = false
            }

            return Disposables.create()
        }
    }
}
