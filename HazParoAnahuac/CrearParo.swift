//
//  CrearParo.swift
//  HazParoAnahuac
//
//  Created by alumno on 18/05/22.
//

import SwiftUI

struct CrearParo: View {
    @State var definicion: String = ""
    @State var tipo: String = ""
    @State var precio: String = ""
    @State var solicitante: String = ""
    @State var de_donde: String = ""
    @State var a_donde: String = ""
    @State var comentario: String = ""
    
    var body: some View {
        VStack{
            Image("perrito1")
                .resizable()
                .frame(width: 200, height: 200)
            VStack{
                TextField("Tipo", text: $tipo)
                TextField("Definición", text: $definicion)
                TextField("Precio", text: $precio)
                    .keyboardType(.numberPad)
                TextField("De dónde", text: $de_donde)
                TextField("A dónde", text: $a_donde)
                TextField("Comentario", text: $comentario)
            }
            VStack{
                Button("Crear Paro", action: {})
            }
        }
        .buttonStyle(.bordered)
        .navigationTitle("Pide Paro")
        .font(.system(size: 30))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CrearParo_Previews: PreviewProvider {
    static var previews: some View {
        CrearParo()
    }
}
