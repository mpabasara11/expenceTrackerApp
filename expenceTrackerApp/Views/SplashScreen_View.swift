//
//  SplashScreen_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-16.
//

import SwiftUI

struct SplashScreen_View: View {
   
    @State private var size : CGFloat = 0.8
    @State private var opacity : Double = 0.5
    @State private var isActive = false
    
    var body: some View {
        
        if isActive
        {
            Login_View()
        }
        else
        {
            
            VStack
            {
                VStack
            {
                Image("lgnpg1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height:120)
                    .font(.system(size: 80))
                    .foregroundColor(.red)
                Text("WalletWise")
                    .font(Font.custom("Baskerville-Bold", size: 26))
                    .foregroundColor(.black.opacity(0.88))
            }.scaleEffect(size)
            .opacity(opacity)
            .onAppear
            {
                withAnimation(.easeIn(duration: 1.2))
                    {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            
                ProgressView
                {
                    Text("Loading")
                        .foregroundColor(.black)
                        .bold()
                }
                    
            
        }.onAppear
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
                {
                withAnimation
                {
                    self.isActive = true
                    
                }
            }
          
        }
            
        }

        
 
    }
    
}

struct SplashScreen_View_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen_View()
    }
}
