//
//  HeaderView.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/18.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let headerLabel = UILabel()
    
    static let headerID = "headerID"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        headerLabel.text = "12345"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
