//
//  Home.swift
//  FrasesAPI
//
//  Created by Juan Cruz on 16/08/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea(.all)
                    .opacity(0.9)
                VStack(spacing: 40){
                    Text("Welcome to the planet of Chuck Norris")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    VStack{
                        Image("chuck-norris")
                            .resizable()
                            .scaledToFit()
                            .frame(width:250, height:250)
                            .padding()
                        Button(action: {}, label: {
                            NavigationLink(destination: FrasesView()) {
                                Text("I want my phrase, Chuck")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .shadow(radius: 10)
                                
                            }
                            
                        })
                        Spacer()
                    }.navigationBarHidden(true)
                }
            }
        }
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
