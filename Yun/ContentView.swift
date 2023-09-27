//
//  ContentView.swift
//  Yun
//
//  Created by Yael Javier Zamora Moreno on 09/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("dinoamor").resizable().ignoresSafeArea()
                VStack {
                    Text("Te amo Yun")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .blue, .green],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Quiero pasar el resto de mi vida contigo😍😍😍")
                        .padding()
                        .font(.largeTitle)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink{
                            History()
                        } label: {
                            Text("Nuestra historia")
                        }
                        Spacer()
                        NavigationLink{
                            Photos()
                        } label: {
                            Text("Nuestras fotos")
                        }
                        Spacer()
                    }
                    Spacer()
                    NavigationLink{
                        Love()
                    } label: {
                        Text("¿Quien ama más?")
                    }
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
