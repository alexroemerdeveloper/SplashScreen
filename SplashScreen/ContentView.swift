//
//  ContentView.swift
//  SplashScreen
//
//  Created by Alexander Römer on 10.10.20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Mercedes Benz AMG")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct SplashScreen: View {
    @State private var animate = false
    @State private var endSplash = false

    var body: some View {
        ZStack {
            HomeView()
            
            ZStack {
                Color(.black)
                Image("AMG")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 150, height: animate ? nil : 150)
                    .scaleEffect(animate ? 7 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateLogo)
            .opacity(endSplash ? 0 : 1)
        }

    }
    
    private func animateLogo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}



