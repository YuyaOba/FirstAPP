//
//  HeaderView.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/18.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let headerID = "headerID"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 75)
        label.layer.position = CGPoint(x: 80, y: 0)
        label.textAlignment = .center
        
        
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLabel.frame.size = self.frame.size
        addSubview(headerLabel)
        
        
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
