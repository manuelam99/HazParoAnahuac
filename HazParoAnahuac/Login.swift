//
//  Login.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct Login: View {
    @State var correo: String = ""
    @State var pass: String = ""
    @StateObject var viewRouter: ViewRouter
    @State var usr: Usuario = Usuario(_id:"", nombre: "", correo: "", password: "")
    
    var body: some View {
        VStack{
            Text("Imagen")
        }
        VStack{
            TextField("Correo", text: $correo)
            SecureField("Contraseña", text: $pass)
        }
        Button("Acceder", action: chckUsr)
        .buttonStyle(.bordered)
    }
    
    func registrarse() -> Void {
        
    }
    
    func chckUsr() -> Void{
        
        guard let url = URL(string: "https://pf-pdmii.glitch.me/usuarios/\(correo)/\(pass)") else
        {
            print("error url")
            return
            
        }
        URLSession.shared.dataTask(with: url)
        { (data,res,error) in
            
            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }
            
            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(Usuario.self, from: d)
                    DispatchQueue.main.async {
                        self.usr = result
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }
                
            }//fin del do
            catch let JsonError
            {
                print("error en json ", JsonError.localizedDescription)
            }
                
                
        }.resume()
        
        if(self.usr._id != ""){
            viewRouter.currentPage = .mainPage
        }
        
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(viewRouter: ViewRouter())
    }
}
