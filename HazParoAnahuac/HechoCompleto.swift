//
//  HechoCompleto.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct HechoCompleto: View {
    @State private var paros = [ParoElement]()
    //
    func llenadatos () async
   {
       
         do
         {
             
             let misParos = try await leeJSONWeb()
             self.paros = misParos
              
         }
           catch {
                   print("Request failed with error:")
               }
       
      
   }
   
   func leeJSONWeb() async throws-> [ParoElement] {
       var an = [ParoElement]()
       let a = ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)
       an.append(a)
       @State var urlconsumo: String = "https://pf-pdmii.glitch.me/paros/ejecutor/6269accea7abe6a6287d89f1/completos"
            print (urlconsumo)
            guard let url = URL(string: urlconsumo) else {
                print("error")
                return an
                        }
       do
       {
            let (data, _) = try await URLSession.shared.data(from: url)
       let conv =  try JSONDecoder().decode([ParoElement].self, from: data)
           return conv
       }
       catch
       {
       print("el error fue \(error)")
       }
       
       return an
   }
    //
    
    var body: some View {
        List(self.paros)
            {
                par in
                NavigationLink(destination: DetalleFavor(paro : par)){
                    ElementoListaParo(paro: par, color:"",titulo: "Hechos Completo")
                }
            }
            .task
            {
                await llenadatos()
            }
            /*NavigationLink(destination: DetalleFavor()){
                ElementoListaParo(titulo: "Hechos Completos")
            }*/
    }//View
}

struct HechoCompleto_Previews: PreviewProvider {
    static var previews: some View {
        HechoCompleto()
    }
}
