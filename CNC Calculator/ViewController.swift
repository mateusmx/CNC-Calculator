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
    
    var indexPosicion = 0
    var indexCuadrante = 0
    
    @IBAction func QuitKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func CambioPosicion(sender: UISegmentedControl) {
        self.indexPosicion = sender.selectedSegmentIndex
        self.CambiarImagen()
        self.Calcular()
    }
    
    @IBAction func CambioCuadrante(sender: UISegmentedControl) {
        self.indexCuadrante = sender.selectedSegmentIndex
        self.CambiarImagen()
        self.Calcular()
    }
    
    func CambiarImagen() {
        if self.indexPosicion == 0 {
            switch self.indexCuadrante {
            case 0:
                self.imImagen.image = UIImage(named: "Horizontal Primer")
            case 1:
                self.imImagen.image = UIImage(named: "Horizontal Segundo")
            case 2:
                self.imImagen.image = UIImage(named: "Horizontal Tercer")
            default:
                self.imImagen.image = UIImage(named: "Horizontal Cuarto")
            }
        }
        else {
            switch self.indexCuadrante {
            case 0:
                self.imImagen.image = UIImage(named: "Vertical Primer")
            case 1:
                self.imImagen.image = UIImage(named: "Vertical Segundo")
            case 2:
                self.imImagen.image = UIImage(named: "Vertical Tercer")
            default:
                self.imImagen.image = UIImage(named: "Vertical Cuarto")
            }
        }
    }
    
    
   
    @IBAction func Calcular() {
        if tfPuntox.text != "" && tfPuntoy.text != "" && tfRadio.text != "" && tfAngulo.text != "" {
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
            
            var dpunto1X: Double!
            var dpunto1Y: Double!
            var dpunto2X: Double!
            var dpunto2Y: Double!
            
            // Posición Horizontal
            if self.indexPosicion == 0 {
                switch self.indexCuadrante {
                    // Primer Cuadrante
                case 0:
                    dpunto2X = puntoX - formula4
                    dpunto2Y = puntoY
                    dpunto1X = puntoX + formula3
                    dpunto1Y = puntoY - formula2
                    
                    // Segundo Cuadrante
                case 1:
                    dpunto2X = puntoX + formula4
                    dpunto2Y = puntoY
                    dpunto1X = puntoX - formula3
                    dpunto1Y = puntoY - formula2
                    
                    // Tercer Cuadrante
                case 2:
                    dpunto1X = puntoX - formula3
                    dpunto1Y = puntoY + formula2
                    dpunto2X = puntoX + formula4
                    dpunto2Y = puntoY
                    
                    // Cuarto Cuadrante
                default:
                    dpunto1X = puntoX + formula3
                    dpunto1Y = puntoY + formula2
                    dpunto2X = puntoX - formula4
                    dpunto2Y = puntoY
                }
            }
                // Posición Vertical
            else {
                switch self.indexCuadrante {
                    // Primer Cuadrante
                case 0:
                    dpunto1X = puntoX - formula2
                    dpunto1Y = puntoY + formula3
                    dpunto2X = puntoX
                    dpunto2Y = puntoY - formula4
                    
                    // Segundo Cuadrante
                case 1:
                    dpunto1X = puntoX + formula2
                    dpunto1Y = puntoY + formula3
                    dpunto2X = puntoX
                    dpunto2Y = puntoY - formula4
                    
                    // Tercer Cuadrante
                case 2:
                    dpunto2X = puntoX
                    dpunto2Y = puntoY + formula4
                    dpunto1X = puntoX + formula2
                    dpunto1Y = puntoY - formula3
                    
                    // Cuarto Cuadrante
                default:
                    dpunto2X = puntoX
                    dpunto2Y = puntoY + formula4
                    dpunto1X = puntoX - formula2
                    dpunto1Y = puntoY - formula3
                }
            }
            
            lbPunto1.text = String(format: "P1 = (%0.2f, %0.2f)", dpunto1X, dpunto1Y)
            lbPunto2.text = String(format: "P2 = (%0.2f, %0.2f)", dpunto2X, dpunto2Y)
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

