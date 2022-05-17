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
                VStack{
                    Text("")
                    Text("Pedidos")
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink("Pendiente",destination: PedidoPendiente())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                        .background(Color(red:0.98,green:0.5,blue:0.04))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    Text("")
                    NavigationLink("Completo",destination: PedidoCompleto())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                        .background(Color(red:0.98,green:0.5,blue:0.04))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    Text("")
                }//fin 2VStack
                Divider()
                VStack{
                    Text("Hechos")
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink("Pendiente",destination: HechoPendiente())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                        .background(Color(red:0.98,green:0.5,blue:0.04))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    Text("")
                    NavigationLink("Completo",destination: HechoCompleto())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                        .background(Color(red:0.98,green:0.5,blue:0.04))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }//fin 2VStack
                Spacer()
            }//VStack
            .navigationTitle("Mis Paros")
            .font(.system(size: 20))
            .navigationBarTitleDisplayMode(.large)
        }//NavigationView
    }
}

struct MisParos_Previews: PreviewProvider {
    static var previews: some View {
        MisParos()
    }
}
