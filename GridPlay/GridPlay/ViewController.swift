//
//  ViewController.swift
//  GridPlay
//
//  Created by Rhytthm Mahajan on 12/02/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    var number = 0
    var dataList: [Int?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  number*number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let cellItem = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            cellItem.setColor(with: dataList[indexPath.row] ?? 0)
            cell = cellItem
        }
        return cell
    }
    
    func initiate(){
        for _ in 0...number*number{
            dataList.append(0)
        }
    }
    
    func setColor(){
        let squared = number*number
        for i in 0...number-1{
            dataList[i] = 1
        }
        for i in squared-number...squared{
            dataList[i] = 1
        }
        for i in 1...number{
            if number*i < squared{
                dataList[number*i] = 1
            }
            if (number+1)*i < squared{
                dataList[(number+1)*i] = 1
            }
            if (number-1)*i < squared{
                dataList[(number-1)*i] = 1
            }
            if(number*i)-1 < squared{
                dataList[(number*i)-1] = 1
            }
        }
    }
    
    func reset(){
        for i in 0...number*number{
            dataList[i] = 0
        }
    }
    

    @IBAction func goTapped(_ sender: Any) {
        if let textEntered = textField.text{
            self.number = Int(textEntered) ?? 0
        }
        initiate()
        reset()
        setColor()
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240/number, height:240/number)
    }
}

