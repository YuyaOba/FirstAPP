//
//  CalucuratecollectionViewCell.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/23.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class CalucuratecollectionViewCell: UICollectionViewCell {
    
    //選択した時に色が変わる
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.numberLabel.alpha = 0.3
            } else{
                self.numberLabel.alpha = 1
            }
        }
    }
    
    let numberLabel: UILabel = {
        let caluculatelabel = UILabel()
        caluculatelabel.textColor = .white
        caluculatelabel.textAlignment = .center
        caluculatelabel.font = .boldSystemFont(ofSize: 32)
        caluculatelabel.clipsToBounds = true
        caluculatelabel.backgroundColor = .orange
        caluculatelabel.text = "1"
        
        return caluculatelabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(numberLabel)
        
        //こうするとnumberLabelのdelegateはHeaderViewになる？
        numberLabel.frame.size = self.frame.size
        numberLabel.layer.cornerRadius = self.frame.height / 2
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

