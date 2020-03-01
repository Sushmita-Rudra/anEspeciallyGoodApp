//
//  HistoryTableViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/26/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
  /*
 required init?(coder: NSCoder) {
        super.init(coder:coder)
    }

*/
    override func viewDidLoad() {
        super.viewDidLoad()
        //super.viewWillAppear(true)
        navigationItem.title = "History"

    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    @IBAction func clearBar(_ sender: Any) {
        
        Predictions.shared.clearResults()
        self.tableView.reloadData()

            }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Predictions.shared.numAttempted()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "espCell", for: indexPath)
        let question = Predictions.shared.question(at: indexPath.row)
        let actualIV  = cell.viewWithTag(100) as! UIImageView
        let predictedIV =  cell.viewWithTag(101) as! UIImageView
        let resultLBL =  cell.viewWithTag(102) as! UILabel



        
        if question!.actualShape == Shape.circle{
            actualIV.image = UIImage(named: "icons8-filled-circle-96")
            
                }
        else if question!.actualShape == Shape.triangle{
            
            actualIV.image = UIImage(named: "icons8-triangle-96")
        }
        else {
            actualIV.image = UIImage(named: "icons8-star-filled-96")
        }
        
        if question!.predictedShape == Shape.circle{
            
            predictedIV.image = UIImage(named: "icons8-filled-circle-96")

        }
        else if question!.predictedShape == Shape.triangle{
            
            predictedIV.image = UIImage(named: "icons8-triangle-96")
        }
        else {
            predictedIV.image = UIImage(named: "icons8-star-filled-96")
        }
        
        if question!.isCorrect!{
            resultLBL.text = "😃"
        }
        else{
            resultLBL.text = "😡"

        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
