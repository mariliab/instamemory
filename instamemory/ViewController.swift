//
//  ViewController.swift
//  instamemory
//
//  Created by Marilia Bognandi on 08/02/17.
//  Copyright © 2017 Marilia Bognandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!

    
    
    var url1:String = "https://api.instagram.com/v1/users/"
    var url2:String = "/media/recent/"
    
    

   
    

    var difficulty: String = ""
    
    @IBAction func selectDifficulty(_ sender: UIButton) {
        
        let defaultBlue = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
        
        //resets color of other buttons
        
        easyButton.setTitleColor(defaultBlue, for: UIControlState.normal
        )
        
        mediumButton.setTitleColor(defaultBlue, for: UIControlState.normal)
        
        hardButton.setTitleColor(defaultBlue, for: UIControlState.normal)
        
        
       // change color of sender button
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        
        difficulty =  "\(sender.titleLabel!.text!)"
        print(difficulty)
        
    }
    
    //Keyboard disappears if user taps on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //keyboard disappears on return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        self.usernameTextField.delegate = self;
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
                    if let data = data, let JsonString = String(data: data, encoding: String.Encoding.utf8) {
                        print(JsonString)
                        
                        let json = JSON(data: JsonString)
                        
                        for item in json["items"].arrayValue {
                            print(item["firstName"].stringValue)
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
       

    }


}

