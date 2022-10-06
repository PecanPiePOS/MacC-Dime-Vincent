//
//  BaseCollectionViewCell.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    func render() {
        // Override Layout
    }
    
    func configUI() {
        // View Configuration
    }
}
