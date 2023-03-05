//
//  CollectionViewCell.swift
//  GridPlay
//
//  Created by Rhytthm Mahajan on 12/02/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    func setColor(with: Int){
        if with == 0{
            self.backgroundColor = .white
        }else{
            self.backgroundColor = .blue
        }
    }
}
            
