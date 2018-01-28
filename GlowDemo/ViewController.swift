//
//  ViewController.swift
//  GlowDemo
//
//  Created by Christian Otkjær on 28/01/2018.
//  Copyright © 2018 Silverback IT. All rights reserved.
//

import UIKit
import Glow

class ViewController: UIViewController
{
    @IBOutlet weak var light: UIView?
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        light?.startGlowing()
    }
    
    @IBAction func toggleGlow(_ sender: UITapGestureRecognizer)
    {
        guard let light = sender.view else { return }
        
        if light.isGlowing { light.stopGlowing() }
        else { light.startGlowing(withColor: light.backgroundColor ?? .white, radius: 20) }
    }
}

