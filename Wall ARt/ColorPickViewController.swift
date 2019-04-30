//
//  ColorPickViewController.swift
//  Wall ARt
//
//  Created by Tyrone Yanaga on 4/29/19.
//  Copyright © 2019 tk74. All rights reserved.
//

import UIKit

//protocol wallColorDelegate {
//    func getColor(color: UIColor)
//}
class ColorPickViewController: UIViewController {

//    var colorDelegate: wallColorDelegate!
    
    @IBOutlet weak var wallColor: UITextField!
    @IBAction func goToAR(_ sender: Any) {
//        //convert wall color text to int and then UIColor
//        let UIWallColor = UIColor(rgb: Int(wallColor.text!)!)
//        //give color to wall color delegate
//        colorDelegate.getColor(color: UIWallColor)
        performSegue(withIdentifier: "toARSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController{
            let UIWallColor = UIColor(rgb: Int(wallColor.text!, radix: 16)!)
            let ARViewController = segue.destination as! ViewController
            ARViewController.wallColor = UIWallColor
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
