//
//  ViewController1.swift
//  LoginFuncionalidad1
//
//  Created by dam2 on 29/11/23.
//

import UIKit

class ViewController1: UIViewController {
    
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UILabel!
    
    var botonTextoDatos = ""
    var contrasenia = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text3.text = botonTextoDatos
        
    }
    
    @IBAction func botonAzulAction(_ sender: Any) {
        downLoadPost()
        
        
        
        
        func downLoadPost(){
            let urlString = "https://qastusoft.com.es/apis/login.php"
            guard let url = URL(string: urlString) else{ return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
            
            let bodyData = "user=\(text1.text ?? "")&pass=\(text2.text ?? "")"
            request.httpBody = bodyData.data(using: String.Encoding.utf8)
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }
                
                if let response = response as? HTTPURLResponse{
                    //   print(response)
                    print("Response code: \(response.statusCode)")
                    
                    
                }
                
                guard let data = data else {return}
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    let code = (json["code"] as! Int)
                    print("bye")
                    
                    DispatchQueue.main.async { [self] in
                        switch code {
                        case 1:
                            self.text3.text =  "ok"
                            
                            
                            let storyBoard2 = UIStoryboard(name: "Main", bundle: nil)
                            let vc2 = storyBoard2.instantiateViewController(identifier: "viewControllerB") as!
                            ViewController2
                            
                            vc2.nombre = text1.text ?? ""
                            vc2.modalPresentationStyle = .fullScreen
                            self.present(vc2, animated: true)
                            
                        case -1:
                            self.text3.text = "Faltan datos"
                        case -2:
                            self.text3.text = "Credenciales no validas"
                        default:
                            return self.text3.text = "Error"
                        }
                    }
                    
                    
                }catch let jsonError {
                    print(jsonError)
                }
                
            }.resume()
            
        }
        
        
        
    }
  
    
}
