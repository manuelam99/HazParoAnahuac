//
//  ElementoListaParo.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct ElementoListaParo: View {
    var paro = ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)
    @State var color = ""
    @State var titulo = ""
    func selecColor () async
   {
       
         do
         {
             
             if(paro.estatus==1){
                 self.color="green"
             }else if(paro.estatus==2){
                 self.color="yellow"
             }else{
                 self.color="orange"
             }
              
         }
       
      
   }
    var body: some View {
        HStack
        {
            Image(color)
                .resizable()
                .frame(width: 50, height: 50)
            VStack
            {
                Text(paro.tipo)
                Text("\(paro.deDonde) - \(paro.aDonde)")
                    .font(.system(size: 10))
            }//VStack
            Text("$\(paro.precio)")
            Spacer()
        }//HStack
        .navigationTitle(Text(titulo))
        .font(.system(size: 20))
        .navigationBarTitleDisplayMode(.large)
        .task {
            await selecColor()
        }
    }
}

struct ElementoListaParo_Previews: PreviewProvider {
    static var previews: some View {
        HechoCompleto()
    }
}
