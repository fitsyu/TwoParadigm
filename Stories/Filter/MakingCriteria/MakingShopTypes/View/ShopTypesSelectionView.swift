//
//  MakingShopTypeDelegate.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 23/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//


import RxCocoa
/**
 A blueprint of unit that can present a list of ShopTypes
 at any point in time, we can get the selection from the list presented
 */
protocol ShopTypeSelectionView: class {
    
    var hasCancelled: BehaviorRelay<Bool> { get }
    var hasDone: BehaviorRelay<Bool> { get }
    
    func present(shopTypes: ShopTypeSelection?)
    
    func selectedShopTypes() -> ShopTypeSelection?
}
