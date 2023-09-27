//
//  Photos.swift
//  Yun
//
//  Created by Yael Javier Zamora Moreno on 09/07/23.
//

import SwiftUI

struct Photos: View {
    
    private var columns = [
        GridItem(),
        GridItem(),
        GridItem(),
    ]
    
    private var imagenes = ["ella", "boda", "dinoamor", "fotoUno", "manos", "you"]
    private var informacion = [
        "Una clara muestra de nuestro amor❤️",
        "Uno de los días más felices de mi vida🥹",
        "Nos representa completamente🥰",
        "Nuestra primera foto mi amor🥹",
        "Nuestras manitas siempre juntas😍",
        "Los dos siendo bellos juntos💘",
    ]
    
    var body: some View {
        LazyHGrid(rows: columns){
            ForEach(0..<6){ photo in
                VStack {
                    Image(imagenes[photo]).resizable().frame(width: 140, height: 140)
                    Text(informacion[photo]).frame(width: 140).multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
