//
//  Registrar.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct Registrar: View {
    @State var nombreUsr: String = ""
    @State var correoUsr: String = ""
    @State var contraUsr: String = ""
    @State var confirmarContraUsr: String = ""
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            Text("Perro chacarron macarron")
        }
        VStack{
            TextField("Nombre", text: $nombreUsr)
            TextField("Correo", text: $correoUsr)
            TextField("Contraseña", text: $contraUsr)
            TextField("Confirmar contraseña", text: $confirmarContraUsr)
        }
        VStack{
            Button("Registrarse", action: registrarUsr)
        }
        .buttonStyle(.bordered)
    }
    
    func registrarUsr() -> Void {
        
    }
}

struct Registrar_Previews: PreviewProvider {
    static var previews: some View {
        Registrar(viewRouter: ViewRouter())
    }
}
