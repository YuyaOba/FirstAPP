//
//  HeaderView.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/18.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let numberHeaderlabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberHeaderlabel.frame.size = self.frame.size
        addSubview(numberHeaderlabel)
        
        numberHeaderlabel.text = "123"
        numberHeaderlabel.textColor = .white
        numberHeaderlabel.font = UIFont.boldSystemFont(ofSize: 40)
        numberHeaderlabel.adjustsFontSizeToFitWidth = true
        numberHeaderlabel.textAlignment = .right
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
}
