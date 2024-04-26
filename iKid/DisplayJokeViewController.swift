//
//  DisplayJokeViewController.swift
//  iKid
//
//  Created by Long Nguyen on 4/25/24.
//

import UIKit

class DisplayJokeViewController: UIViewController {

    @IBOutlet weak var punchline: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func displayJoke(joke: String) {
        punchline.text = joke
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
