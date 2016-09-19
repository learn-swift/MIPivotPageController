//
//  ViewController.swift
//  MIPivotPageController
//
//  Created by Mario on 17/09/16.
//  Copyright © 2016 Mario Iannotta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        perform(#selector(ViewController.pp(sender:)), with: nil, afterDelay: 0.1, inModes: [.defaultRunLoopMode])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pp(sender: AnyObject?) {
        
        let myBlueColor = UIColor(red: 34/255.0, green: 167/255.0, blue: 240/255.0, alpha: 1)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let singleViewController = mainStoryboard.instantiateViewController(withIdentifier: "SingleViewController") as! SingleViewController
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = myBlueColor
        navigationController.navigationBar.tintColor = UIColor.white
        
        let pivotPageController = MIPivotPageController.get(rootPages: [singleViewController, navigationController, tabBarController]) {
            
            $0.menuView.backgroundColor = myBlueColor
            $0.menuView.layer.shadowColor = UIColor.black.cgColor
            $0.menuView.layer.shadowOpacity = 0.3
            $0.menuView.layer.shadowOffset = CGSize(width: 0, height: 2)
            
            $0.setMenuHeight(60)
            
            $0.setLightStatusBar(true)
            
        }
        
        present(pivotPageController, animated: true, completion: nil)
        
    }

}

