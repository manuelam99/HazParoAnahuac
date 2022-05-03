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
    
    var body: some View {
        VStack{
            Text("Imagen")
        }
        VStack{
            TextField("Correo", text: $correo)
            TextField("Contraseña", text: $pass)
        }
        VStack{
            Button("Acceder", action: logIn)
            Button("Registrarse", action: registrarse)
        }
        .buttonStyle(.bordered)
    }
    
    func logIn() -> Void {
        
    }
    
    func registrarse() -> Void {
        
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
