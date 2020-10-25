//
//  MainTableViewController.swift
//  FirstApp
//
//  Created by 大場勇弥 on 2020/10/09.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    private let cellID = "cellID"
    private let headerID = "headerID"
    
    let tax:Double = 1.1
    
    
    
    //配列の作成
    let numbers = [
        ["%引","割引","税"],
        ["7","8","9"],
        ["4","5","6"],
        ["1","2","3"],
        ["0","00","決","C"],
    ]
    
    //CollectionViewの作成
    let collectionView: UICollectionView = {
        
        let cellID = "cellID"
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CalucuratecollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        cv.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")

        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
    
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        //collectionView全体の位置を下にしたい。
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.contentInsetAdjustmentBehavior = .never
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
}


extension MainTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    //cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * 10) / 4
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numbers[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CalucuratecollectionViewCell
        
        cell.numberLabel.text = numbers[indexPath.section][indexPath.row]
        
        numbers[indexPath.section][indexPath.row].forEach { (numberString)in
            

        
    }
    
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
    }
    
    
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! HeaderView
    header.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 110)
    
    return header
    }
    
    //下記のコードの記載のみだと、配列の間位にHeaferがはいっている状態になる。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: self.view.bounds.width, height: 110)
         
        } else {
             return CGSize.zero

        }
    }
    
    
}
