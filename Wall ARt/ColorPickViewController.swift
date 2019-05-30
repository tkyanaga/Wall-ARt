//
//  ColorPickViewController.swift
//  Wall ARt
//
//  Created by Tyrone Yanaga on 4/29/19.
//  Copyright © 2019 tk74. All rights reserved.
//

import UIKit

class ColorPickViewController: UIViewController {

    let defaultColor = 0xA9CBB1
//    var colorDelegate: wallColorDelegate!
    //MARK: Properties
    @IBOutlet weak var wallColor: UITextField?
    
    //MARK: Actions
    @IBAction func goToAR(_ sender: Any) {
        performSegue(withIdentifier: "toARSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController{
            let UIWallColor = UIColor(rgb: Int(wallColor?.text ?? "03F234", radix: 16) ?? defaultColor)
            let ARViewController = segue.destination as! ViewController
            ARViewController.wallColor = UIWallColor
        }
    }
        
    @IBAction func goToCamera(_ sender: Any) {
        performSegue(withIdentifier: "toCameraSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
