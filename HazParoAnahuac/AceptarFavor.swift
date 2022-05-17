//
//  AceptarFavor.swift
//  HazParoAnahuac
//
//  Created by alumno on 17/05/22.
//

import SwiftUI

struct AceptarFavor: View {
    var paro = ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)
    @State private var color = ""
    @State private var miEstatus = ""
    func selecColor () async
   {
       
         do
         {
             
             if(paro.estatus==1){
                 self.color="green"
                 self.miEstatus="Paro en Espera"
             }else if(paro.estatus==2){
                 self.color="yellow"
                 self.miEstatus="Paro en Ejecución"
             }else{
                 self.color="orange"
                 self.miEstatus="Paro Completado"
             }
              
         }
       
      
   }
    var body: some View {
        VStack
        {
            Text("Tipo: \(paro.tipo)")
            Text("De: \(paro.deDonde)")
            Text("A: \(paro.aDonde)")
            Text("Precio: $\(paro.precio)")
            HStack{
                Image(color)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Estatus: \(self.miEstatus)")
            }
            Divider()
            Text("Pedido por: \(paro.solicitante)")
            Divider()
            VStack{
                Text("\n").font(.system(size: 10))
                Button(action: {
                            }, label: {
                                Text("Aceptar Paro")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                )
            }//fin 2VStack
        }//fin VStack
        .navigationTitle("Aceptar Paro")
        .font(.system(size: 30))
        .navigationBarTitleDisplayMode(.large)
        .task {
            await selecColor()
        }
    }
}

struct AceptarFavor_Previews: PreviewProvider {
    static var previews: some View {
        AceptarFavor()
    }
}
