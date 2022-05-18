//
//  AceptarFavor.swift
//  HazParoAnahuac
//
//  Created by alumno on 17/05/22.
//

import SwiftUI

struct AceptarFavor: View {
    var paro = ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)
    @State var paros = [ParoElement]()
    @State var regreso = DataModel(error: true, message: "", data: [ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)])
    @State private var color = ""
    @State private var miEstatus = ""
    //MARK: - aceptarParo
    func aceptarParo(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "https://pf-pdmii.glitch.me/paroUpdate") else
        {
            print("error url")
            return
            
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request)
        { (data,res,error) in
            
            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }
            
            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.paros = result.data
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }
                
            }//fin del do
            catch let JsonError
            {
                print("error en json ", JsonError.localizedDescription)
             }
                
                
        }.resume() // fin dataTask

    } //fin de creaFruits
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
                    let params : [String:Any]  = [
                        "id": self.paro.id, "definicion": self.paro.definicion, "tipo": self.paro.tipo, "precio": self.paro.precio, "solicitante": self.paro.solicitante, "ejecutor": self.paro.ejecutor, "deDonde": self.paro.deDonde, "aDonde": self.paro.aDonde, "comentario": self.paro.comentario, "estatus": self.paro.estatus
                    ]
                    aceptarParo(parameters: params)
                        }, label: {
                            Text("Hacer Paro")
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
