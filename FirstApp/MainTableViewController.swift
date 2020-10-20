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
        cv.register(CaluculateViewCell.self, forCellWithReuseIdentifier: cellID)
        cv.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")

        
        return cv
    }()
    

    
    //cellの中に入るラベルの作成
    class CaluculateViewCell: UICollectionViewCell {
        
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
            
            numberLabel.frame.size = self.frame.size
            numberLabel.layer.cornerRadius = self.frame.height / 2
            backgroundColor = .white
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(collectionView)
        view.backgroundColor = .groupTableViewBackground
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        //collectionView全体の位置を下にしたい。
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CaluculateViewCell
        
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
        header.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 200)
        header.backgroundColor = .blue
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return.init(width:view.frame.width, height:  10)
    }
    
   
    
    
}

