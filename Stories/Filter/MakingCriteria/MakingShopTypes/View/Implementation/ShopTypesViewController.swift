//
//  ShopTypesViewController.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 23/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//


import UIKit
import NSelect
import RxCocoa

class ShopTypeViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var nSelectView: DefaultNSelectView!
    
    override func loadView() {
        
        self.view = viewFromNib(named: "ShopTypesView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // event
        closeButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        applyButton.addTarget(self, action: #selector(apply), for: .touchUpInside)
    }
    
    @objc func goBack() {
        hasCancelled.accept(true)
    }
    
    @objc func reset() {
        nSelectView.reset()
    }
    
    @objc func apply() {
        
        if let selectionsMade = nselect.selections() {
            
            shopTypes.value.removeAll()
            for item in selectionsMade {
                shopTypes.value.append( (ShopType(name: item), true) )
            }
        }
        
        hasDone.accept(true)
    }
    
    private var nselect: NSelect = NSelect()
    private var shopTypes: ShopTypeSelection = ShopTypeSelection(value: [])
    
    
    // Requirement conformance
    var hasCancelled: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var hasDone: BehaviorRelay<Bool>      = BehaviorRelay(value: false)
}


extension ShopTypeViewController: ShopTypeSelectionView {
    
    
    func present(shopTypes: ShopTypeSelection?) {
        
        if let items = shopTypes {
            self.shopTypes = items
        }
        
        // setup NSelect
        nselect = NSelect()
        nselect.title   = "Choose one or more"
        nselect.options = self.shopTypes.value.map { $0.0.name }
        nselect.mode    = .multiple
        nselect.defaultSelections = self.shopTypes.value.filter { $0.1 == true }.map { $0.0.name }
        
        nSelectView.backing = nselect
        nSelectView.present()
    }
    
    func selectedShopTypes() -> ShopTypeSelection? {
        return shopTypes.value.count > 0 ? shopTypes : nil
    }
}

