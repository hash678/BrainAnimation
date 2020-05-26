//
//  ViewController.swift
//  BrainAnimation
//
//  Created by Hassan Abbasi on 26/05/2020.
//  Copyright © 2020 Hassan Abbasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var aView: FillAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aView)
        aView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        aView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        aView.widthAnchor.constraint(equalToConstant:300).isActive = true
        
        //Animate view
        //aView.animateView()
        
        //Set percentage 0-1
        aView.setImage(#imageLiteral(resourceName: "Brain (1)"))
        //aView.setValue(0.5)
        aView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
    }
    
    @objc fileprivate func tapped(){
        aView.setValue(0.5)
    }
    
    
}



