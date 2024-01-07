//
//  ViewController3.swift
//  LoginFuncionalidad1
//
//  Created by dam2 on 29/11/23.
//

import UIKit

class ViewController3: UIViewController {

    
    @IBOutlet weak var labelComtrasenia: UILabel!
    

    var botonTextoDatos = ""
    var nombre = ""
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelComtrasenia.text = botonTextoDatos
            
    }
    
    
    
    @IBAction func datos(_ sender: Any) {
        
        let storyBoard2 = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyBoard2.instantiateViewController(identifier: "viewControllerA") as!
        ViewController1
        
        vc2.botonTextoDatos = text
        vc2.modalPresentationStyle = .fullScreen
        self.present(vc2, animated: true)
        
    }
    
   
    

}





