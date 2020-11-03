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
    
    //税
    let tax:Double = 1.1
    //Pickerに代入する割引の配列
    let discount = ["1割引き","2割引き","３割引き","4割引き","5割引き","6割引き","7割引き","8割引き","9割引き"]
    //Pickerに代入する％引きの配列
    let percent = ["10%引き","20%引","30%引き","40%引き","50%引","60%引き","70%引き","80%引き","90%引き"]
    
    let number = [10,20,30,40,50,60,70,80,90]
    
    
    
    //配列の作成
    //別のボタンとして認識させたい["%引","割引","税"]は別の定数で作って認識させてPickerを出すようにしたほうがいい？
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
    
    
    let selectPicler: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
    
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(collectionView)
        view.addSubview(selectPicler)
        
        
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //collectionView全体の位置を下にしたい。
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 96).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.contentInsetAdjustmentBehavior = .never
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        //Pickerのdatasource、delegates
        selectPicler.delegate = self
        selectPicler.dataSource = self
    }
    
    
}

extension MainTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //セクションの数をいくつ返すか
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //セクションの中に何個値を表示させるか
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percent.count
    }
    //中身のタイトルの表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return discount[row]
    }
}


extension MainTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    //cell
    //Cellの大きさを定義している。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * 10) / 4
        return .init(width: width, height: width)
    }
    
    
    //セクションこごとの、それぞれのせCellにいアクセスできるようにしている。
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CalucuratecollectionViewCell
        
        cell.numberLabel.text = numbers[indexPath.section][indexPath.row]
        
        numbers[indexPath.section][indexPath.row].forEach { (numberString)in
            if "0"..."9" ~= numberString {
                cell.numberLabel.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            } else if numberString == "C" {
                cell.numberLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
        
        return cell
    }
    
    //アイテムの数をセクションごとに画面に返している。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers[section].count
    }
    
    //配列numbersのカウントを返している。
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numbers.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //Cellno感覚のコード
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    //Cellがタップされた時の挙動
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let number = numbers[indexPath.section][indexPath.row]
        print(number)
        //ここにHeaderLabelに表示させたい。
    }
    
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! HeaderView
        header.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 120)
        header.backgroundColor = .lightGray
        
        return header
    }
    
    //下記のコードの記載のみだと、配列の間位にHeaferがはいっている状態になる。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0{
            return CGSize(width: self.view.bounds.width, height: 120)
            
        } else {
            return CGSize.zero
            
        }
    }
}
