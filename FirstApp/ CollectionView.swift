//
//   CollectionView.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/12.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

final class CollectionView: UICollectionViewCell {
    
    private let fruitsNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 3.0
        
        contentView.addSubview(fruitsNameLabel)
    }
    
    func setupContents(textName: String) {
        fruitsNameLabel.text = textName
    }
}
