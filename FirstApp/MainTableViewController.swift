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
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"],
        ["1","2","3","4"],
    ]
    
    //CollectionViewの作成
    let collectionView: UICollectionView = {
        
        let cellID = "cellID"
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CalucuratecollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        cv.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")

        cv.contentInset.bottom = 20
        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(collectionView)
        view.backgroundColor = .groupTableViewBackground
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        //collectionView全体の位置を下にしたい。
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset.bottom = 20
        
        
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
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
    
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! HeaderView
        header.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 20)
        header.backgroundColor = .blue
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 20)
        
        return size
    }
    
   
    
    
}

