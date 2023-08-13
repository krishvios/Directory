//
//  SplashView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                VStack {
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .background(Color.white)
                        .foregroundColor(Color("Brand"))
                    Text((Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String)!)
                        .font(.largeTitle)
                    
                        .foregroundColor(Color("Brand"))
                        .padding(.top, -50)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
                withAnimation {
                    self.isActive = true
                }
            })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
