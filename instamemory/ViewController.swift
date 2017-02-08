//
//  ViewController.swift
//  instamemory
//
//  Created by Marilia Bognandi on 08/02/17.
//  Copyright © 2017 Marilia Bognandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    var url1:String = "https://api.instagram.com/v1/users/"
    var url2:String = "/media/recent/"
    
    
    
    

    var difficulty: String = ""
    
    @IBAction func selectDifficulty(_ sender: UIButton) {
        
        difficulty =  "\(sender.titleLabel!.text!)"
        print(difficulty)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        let urlString = URL(string: "\(url1)" + "\(usernameTextField!.text!)" + "\(url2)")
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
                if error != nil {
                    print (error)
                } else {
                    if let usableData = data {
                        print (usableData)
                    }
                }
            }
            task.resume()
        }
       

    }


}

