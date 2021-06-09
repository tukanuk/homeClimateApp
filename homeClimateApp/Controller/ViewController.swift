//
//  ViewController.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewText: UITableView!
    @IBOutlet weak var DetailText: UITextView!
    
    var climateManager = ClimateManager()
    let vegetables = ["Carrot", "Broccoli", "Cucumber", "Red Pepper", "Squash", "Zuchini"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let data = climateManager.loadJSON("Data/sampleData")
        let results = climateManager.parseJSON(data!)

        // create output
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MMdd HH:mm"
        
        // Create an array of just timestamps
        // Problem here is that this is not available in time for the tableView to use it
        var timeStamps = [String]()
        for result in results! {
            timeStamps.append(formatter.string(from: result.timeStamp))
        }
        
        var detailText = ""
        for rec in results! {
            detailText += "\(formatter.string(from: rec.timeStamp)) : 🌡\(rec.temperature)C\t\t💦\(rec.humidity)%\n"
        }
        
        DetailText.text = detailText
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        tableViewText.reloadData()
//    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetables.count
//        return timeStamps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a dynamic plain cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
            
//        cell.textLabel!.text = vegetables[indexPath.row]
        cell.textLabel!.text = vegetables[indexPath.row]
        
        return cell
        
    }
}
