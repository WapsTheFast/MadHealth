//
//  NoInternetViewController.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 18.11.22.
//

import UIKit

class NoInternetViewController: UIViewController {

    @IBAction func checkInternet(_ sender: Any) {
        if currentReachabilityStatus == .reachableViaWWAN || currentReachabilityStatus == .reachableViaWiFi{
            closeScreen()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension NoInternetViewController{
    func closeScreen(){
        self.show(UIAlertController(title: "Conected", message: "You are conected now", preferredStyle: .actionSheet), sender: nil) 
    }
}

