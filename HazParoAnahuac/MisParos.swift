//
//  MisParos.swift
//  HazParoAnahuac
//
//  Created by alumno on 04/05/22.
//

import SwiftUI

struct MisParos: View {
    var body: some View {
        VStack{
            Text("Mis Paros")
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, alignment: .center)
            Text("Pedidos")
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, alignment: .leading)
            Button("Pendientes"){
                PedidoPendiente()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }//VStack
    }
}

struct MisParos_Previews: PreviewProvider {
    static var previews: some View {
        MisParos()
    }
}
