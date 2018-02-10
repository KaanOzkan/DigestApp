//
//  TableViewController.swift
//  Digest
//
//  Created by Kaan Ozkan on 2018-02-03.
//  Copyright © 2018 Kaan Ozkan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	var media = [Media]()
    override func viewDidLoad() {
        super.viewDidLoad()
		loadMedia()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	private func loadMedia(){
		// TODO: populate data when clicked, not upon loading
		var redditData = [String: String]()
		guard let reddit = Media(name: "Reddit") else {
			fatalError("Unable to instantiate Media object, Reddit")
		}
		var quoraData = [String: String]()
		guard let quora = Media(name: "Quora") else {
			fatalError("Unable to instantiate Media object, Quora")
		}
		media += [reddit, quora]
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return media.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "TableViewCell"

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell

	    // Configure the cell...

		let media = self.media[indexPath.row]
		cell.label.text = media.name

        return cell
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destination = segue.destination as! ViewController
		//TODO: implement logic in viewController to handle various media
		destination.reddit = self.media[0]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
