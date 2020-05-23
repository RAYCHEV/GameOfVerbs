//
//  RankingsTableViewController.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 30.11.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

enum OrderByButtonCondition {
    case scoreDec
    case timeDec
}

class RankingsTableViewController: UITableViewController {
    
    @IBOutlet weak var orderByButton: UIBarButtonItem!
    
    var rankings:[Ranking] = [Ranking]()
    var orderByButtonCondition: OrderByButtonCondition = .timeDec
    //var indexPathOnFocus: IndexPath = IndexPath(index: 0)
        //[Ranking.init(id: "193", username: "Kotio Mam", points: "13"), Ranking.init(id: "924", username: "Mamin Mamnik", points: "5") ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        rankings = RankingManager.getOrderByDateTimeRanking()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.rankings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankingTableViewCell", for: indexPath) as! RankingTableViewCell
        
        cell.userNameLabel.text = rankings[indexPath.row].username
        cell.points.text = rankings[indexPath.row].points
        cell.backgroundColor = #colorLiteral(red: 0.8600289226, green: 0.9943782687, blue: 0.8939129114, alpha: 1)
        
        if rankings[indexPath.row].id == RankingManager.getLatestAddedRankingId(){
            cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        return cell
    }
    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func orderByButtonAction(_ sender: UIBarButtonItem) {
        switch orderByButtonCondition {
        case .scoreDec:
            rankings = RankingManager.getOrderByScoreRanking()
            orderByButtonCondition = .timeDec
            orderByButton.title = "Newest irst"
            
        case .timeDec:
            rankings = RankingManager.getOrderByDateTimeRanking()
            orderByButtonCondition = .scoreDec
            orderByButton.title = "Order by Score"
        }
        self.tableView.reloadData()
        //        self.refreshControl?.endRefreshing()

    }
    
}
