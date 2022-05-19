//
//  DetalleFavor.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct DetalleFavor: View {
    var paro = ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)
    @State private var color = ""
    @State private var miEstatus = ""
    @State private var miReceptor = ""
    
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
             if(paro.ejecutor == ""){
                 miReceptor=""
             }else{
                 miReceptor="Realizado por: \(paro.ejecutor)"
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
            Text(self.miReceptor)
        }//fin VStack
        .navigationTitle("Detalle del Paro")
        .font(.system(size: 30))
        .navigationBarTitleDisplayMode(.large)
        .task {
            await selecColor()
        }
    }
}

struct DetalleFavor_Previews: PreviewProvider {
    static var previews: some View {
        DetalleFavor()
    }
}
