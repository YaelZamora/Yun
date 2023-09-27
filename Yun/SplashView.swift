//
//  SplashView.swift
//  Yun
//
//  Created by Yael Javier Zamora Moreno on 10/07/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive : Bool = false
    
    var body: some View {
        ZStack{
            if self.isActive {
                ContentView()
            } else {
                Image("fotoUno").resizable().ignoresSafeArea()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
