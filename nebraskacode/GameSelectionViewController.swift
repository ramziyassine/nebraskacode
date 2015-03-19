//
//  GameSelectionViewController.swift
//  nebraskacode
//
//  Created by Ramzi Yassine on 3/19/15.
//  Copyright (c) 2015 Ramzi Yassine. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController {
    @IBOutlet var gameTable: UITableView!
    var allGames: Array<Game> {
        let application = UIApplication.sharedApplication()
        let delegate = application.delegate as! AppDelegate
        let moc = delegate.managedObjectContext
        let gameArray = Game.readAllGames(moc!)
        return gameArray
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let name = "CreateGamePopoverSegue"
        if segue.identifier == name {
            let application = UIApplication.sharedApplication()
            let delegate = application.delegate as! AppDelegate
            let moc = delegate.managedObjectContext
            
            let destinationController = segue.destinationViewController as! NewGameViewController
            destinationController.currentContext = moc
            destinationController.allGames = allGames
        }
        
        
        
        
        
        
        
    }
}



extension GameSelectionViewController: UITableViewDataSource {
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            let rows = self.allGames.count
            return rows;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let game = self.allGames[indexPath.row]
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        var statusString = "$\(game.score), \(game.correctResponses)/\(game.incorrectResponses)/\(game.noResponses)"
        if !game.inProgress {
            statusString += " (NEW)"
        }
        if game.isFinished {
            statusString += " (FINISHED)"
        }
        let selectionCell = GameSelectionViewCell.cellForTableView(tableView, withGameDateType: "\(game.stringForEnum(game.gameType.integerValue).uppercaseString) - \(formatter.stringFromDate(game.gameDate).uppercaseString)", withGameStatus: statusString)
        return selectionCell
    }
}