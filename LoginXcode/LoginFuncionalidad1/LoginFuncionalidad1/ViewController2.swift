//
//  ViewController2.swift
//  LoginFuncionalidad1
//
//  Created by dam2 on 29/11/23.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var holaSaludo: UILabel!
    
    var nombre = ""


    override func viewDidLoad() {
        super.viewDidLoad()

     
        holaSaludo.text = "Hola, \(nombre)"

    }
    
}
