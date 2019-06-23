//
//  ShopTypesSelection.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 23/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

/**
 Expressing the object of ShopType selections
 */
struct ShopTypeSelection {
    
    /**
     array containing ShopType paired with their selection status
     `true` if selected, `false` otherwise
     */
    var value: [ (ShopType, Bool) ]
}
