//
//  GameSelectionViewCell.swift
//  nebraskacode
//
//  Created by Ramzi Yassine on 3/19/15.
//  Copyright (c) 2015 Ramzi Yassine. All rights reserved.
//

import UIKit

class GameSelectionViewCell: UITableViewCell {
    @IBOutlet var lblGameDateType: UILabel!
    @IBOutlet var lblGameStatus: UILabel!
    
    var gameDateType: String = "" {
        didSet {
            lblGameDateType.text = gameDateType
        }
    }
    var gameStatus: String = "" {
        didSet {
            lblGameStatus.text = gameStatus
        }
    }
    
    class func cellForTableView(tableView: UITableView, withGameDateType: String, withGameStatus: String) -> GameSelectionViewCell {
        var newCell = tableView.dequeueReusableCellWithIdentifier("GameSelectionCell") as! GameSelectionViewCell
        
        newCell.gameDateType = withGameDateType
        newCell.gameStatus = withGameStatus
        
        return newCell
    }
   
}
