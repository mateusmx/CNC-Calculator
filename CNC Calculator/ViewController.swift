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

