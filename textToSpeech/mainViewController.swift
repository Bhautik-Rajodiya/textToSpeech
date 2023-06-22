//
//  mainViewController.swift
//  textToSpeech
//
//  Created by R96 on 17/06/23.
//

import UIKit

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        neviget()
    }
    
    func neviget(){
        let n = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        
        navigationController?.pushViewController(n, animated: true)
    }
}
