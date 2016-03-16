//
//  ViewController.swift
//  CNC Calculator
//
//  Created by Pablo Diaz on 16/03/16.
//  Copyright © 2016 Ioanis Constantinou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scPosicion: UISegmentedControl!
    @IBOutlet weak var scCuadrante: UISegmentedControl!
    @IBOutlet weak var imImagen: UIImageView!
    @IBOutlet weak var tfPuntox: UITextField!
    @IBOutlet weak var tfPuntoy: UITextField!
    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var tfAngulo: UITextField!
    @IBOutlet weak var lbPunto1: UILabel!
    @IBOutlet weak var lbPunto2: UILabel!
    @IBOutlet weak var lbFormula1: UILabel!
    @IBOutlet weak var lbFormula2: UILabel!
    @IBOutlet weak var lbFormula3: UILabel!
    @IBOutlet weak var lbFormula4: UILabel!
    
    
    @IBAction func CambioPosicion(sender: UISegmentedControl) {
        
    }
    
    @IBAction func CambioCuadrante(sender: UISegmentedControl) {
        
    }
   
    @IBAction func Calcular() {
        if tfPuntox.text != nil && tfPuntoy.text != nil && tfRadio.text != nil && tfAngulo.text != nil {
            let puntoX = Double(tfPuntox.text!)!
            let puntoY = Double(tfPuntoy.text!)!
            let radio = Double(tfRadio.text!)!
            let angulo = Double(tfAngulo.text!)! * M_PI / 180.0
            let formula1 = radio * cos(angulo)
            let formula2 = radio - formula1
            let formula3 = formula2 / tan(angulo)
            let formula4 = radio * sin(angulo) - formula3
            
            lbFormula1.text = String(format: "F1 = %0.2f", formula1)
            lbFormula2.text = String(format: "F2 = %0.2f", formula2)
            lbFormula3.text = String(format: "F3 = %0.2f", formula3)
            lbFormula4.text = String(format: "F4 = %0.2f", formula4)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

