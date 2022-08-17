//
//  FrasesView.swift
//  FrasesAPI
//
//  Created by Juan Cruz on 16/08/2022.
//

import SwiftUI

struct FrasesView: View {
    @State private var FrasesData : Frases?
    
    //Como no esta funcionando el icon-url de la API se aplica en el contentview una imagen url generica a traves de un AsyncImage
    private var imageURL = URL(string: "https://gcdn.emol.cl/artes-marciales/files/2019/06/chuck-norris-karate-komando-1024x576.jpg")
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
                .opacity(0.9)
            VStack{
                AsyncImage(url: imageURL!) {image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                VStack{
                    Text(FrasesData?.value ?? "")
                        .font(.title2).italic()
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .onAppear(perform: loadData)
                Button(action: loadData){
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(100)
                        .shadow(radius: 10)
                }
                Spacer()
            }
            
        }
    }
    
    //Func get API
    
    private func loadData(){
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodeData = try? JSONDecoder().decode(Frases.self, from: data) {
                DispatchQueue.main.async {
                    self.FrasesData = decodeData
                }
            }
        }.resume()
    }
}

struct FrasesView_Previews: PreviewProvider {
    static var previews: some View {
        FrasesView()
    }
}
