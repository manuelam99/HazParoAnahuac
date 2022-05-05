//
//  MisParos.swift
//  HazParoAnahuac
//
//  Created by alumno on 04/05/22.
//

import SwiftUI

struct MisParos: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("")
                Text("Pedidos")
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink("Pendiente",destination: PedidoPendiente())
                    .frame(maxWidth: .infinity, alignment: .leading)
                NavigationLink("Completo",destination: PedidoCompleto())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("")
                Text("Hechos")
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink("Pendiente",destination: HechoCompleto())
                    .frame(maxWidth: .infinity, alignment: .leading)
                NavigationLink("Completo",destination: HechoCompleto())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }//VStack
            .navigationTitle("Mis Paros")
            .font(.system(size: 20))
            .navigationBarTitleDisplayMode(.inline)
        }//NavigationView
    }
}

struct MisParos_Previews: PreviewProvider {
    static var previews: some View {
        MisParos()
    }
}
