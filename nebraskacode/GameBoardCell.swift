//
//  GameBoardCell.swift
//  nebraskacode
//
//  Created by Ramzi Yassine on 3/19/15.
//  Copyright (c) 2015 Ramzi Yassine. All rights reserved.
//

import UIKit

class GameBoardCell: UICollectionViewCell {
    @IBOutlet var cellValueLabel: UILabel!
    
    var cellValueString: String = "" {
        didSet {
            cellValueLabel.text = cellValueString
        }
    }
    
    var alreadySelected = false
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: NSIndexPath, cellValue: String) -> GameBoardCell {
        var newCell : GameBoardCell = collectionView.dequeueReusableCellWithReuseIdentifier("GameBoardCell", forIndexPath: indexPath) as! GameBoardCell
        newCell.cellValueString = cellValue
        return newCell
    }
}
