//
//  FeedFavores.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct FeedFavores: View {
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
       @State var urlconsumo: String = "https://pf-pdmii.glitch.me/paros/1"
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
        NavigationView{
            VStack{
                List(self.paros)
                    {
                        par in
                        NavigationLink(destination: AceptarFavor(coreDM: CoreDataManager(), paro : par)){
                            ElementoListaParo(paro: par, color:"",titulo: "Haz Paro")
                        }
                    }
                    .task
                    {
                        await llenadatos()
                    }
                    /*NavigationLink(destination: DetalleFavor()){
                        ElementoListaParo(titulo: "Hechos Completos")
                    }*/
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarTrailing){
                            NavigationLink("+   ",destination: CrearParo())
                                .frame(alignment: .leading)
                                .font(.title2)
                                .background(Color(red:0.98,green:0.5,blue:0.04))
                                .foregroundColor(Color.white)
                                .cornerRadius(3)
                                .shadow(radius: 3)
                        }
                    }
            }//fin VStack
        }//fin NavigationView
    }//View body
}

struct FeedFavores_Previews: PreviewProvider {
    static var previews: some View {
        FeedFavores()
    }
}
