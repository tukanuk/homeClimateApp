//
//  ViewController.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var DetailText: UITextView!
    
    var climateManager = ClimateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let data = climateManager.loadJSON("Data/sampleData")
        let results = climateManager.parseJSON(data!)
        DetailText.text = results?[0].output()
        
    
        print("Snark")
        print(results)
    }


}

