//
//  MakingShopTypes.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 22/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

// high-level design

// I need someone who given list of shop-types she can ask our user of shop-types they want
// ask means:
//  -> present the question
//  -> get the answer

import RxSwift

// The process
class MakingShopTypes: Story {
    
    // Mandatory
    public var view: ShopTypeSelectionView!
    
    // Optional
    public var data: ShopTypeSelection?
    public var delegate: MakingShopTypesDelegate? = DefaultMakingShopTypesDelegate()
    
    init(view: ShopTypeSelectionView, data: ShopTypeSelection? = nil) {
        
        self.view  = view
        self.data  = data
    }

    public func begin() {
        
        setupDoneEvent()
        setupCancelEvent()
        
        view.present(shopTypes: data)
    }
    
    private let disposeBag = DisposeBag()
    
    private func setupDoneEvent() {
        
        view.hasDone
            .asObservable()
            .filter { $0 == true }
            .subscribe(onNext: { next in
                let selections = self.view.selectedShopTypes()
                self.delegate?.end(with: selections)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCancelEvent() {
        
        view.hasCancelled
            .asObservable()
            .filter { $0 == true }
            .subscribe(onNext: { event in
                self.delegate?.canceled()
            }).disposed(by: disposeBag)
    }
    
}


protocol MakingShopTypesDelegate {
    
    func canceled()
    
    func end(with: ShopTypeSelection?)
}


class DefaultMakingShopTypesDelegate: MakingShopTypesDelegate {
    
    func canceled() {
        
        print("story of making shop types has been canceled")
    }
    
    func end(with: ShopTypeSelection?) {
        
        let selections = with?.value.compactMap { $0.0.name }.joined(separator: ", ") ?? "nothing"
        print("story ends with \(selections)")
    }
}
