//
//  Perfil.swift
//  HazParoAnahuac
//
//  Created by alumno on 04/05/22.
//

import SwiftUI

struct Perfil: View {
    @State var nombre: String = ""
    @State var correo: String = ""
    
    var body: some View {
        VStack{
            Text("Mi perfil")
            Text("Imagen")
            VStack{
                TextField("Nombre", text: $nombre)
                TextField("Correo", text: $correo)
            }
            VStack{
                Button("Actualizar datos", action: actualizarDatos)
                Button("Cambiar contraseña", action: cambiarContrasena)
            }
        }
        .buttonStyle(.bordered)
    }
    
    func actualizarDatos() -> Void {
        
    }
    
    func cambiarContrasena() -> Void {
        
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
