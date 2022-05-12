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
    var usr: Usuario
    
    var body: some View {
        VStack{
            Text("Imagen")
        }
        VStack{
            TextField("Correo", text: $correo)
            SecureField("Contraseña", text: $pass)
        }
        Button("Acceder", action: logIn)
        .buttonStyle(.bordered)
    }
    
    func logIn() -> Void {
        viewRouter.currentPage = .mainPage
    }
    
    func registrarse() -> Void {
        
    }
    
    func chckUsr() async -> Usuario{
        var res: Bool = false
        
        guard let url = URL(string: "https://pf-pdmii.glitch.me/") else
        {
            print("error url")
            return false
            
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
                        self.frutas = result.data
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
        
        return res
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(viewRouter: ViewRouter())
    }
}
