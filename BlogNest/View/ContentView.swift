//
//  ContentView.swift
//  BlogNest
//
//  Created by Sanket Khatua on 12/09/25.
//

import SwiftUI

struct ContentView: View {
    
    let geners = ["Business", "Politics", "Health", "Food", "Lifestyle", "Travel"]
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 20) {
                
//                Top bar:
                
                HStack(spacing: 170) {
                    
                    Text("BlogNest")
                        .font(.title)
                        .bold()
                    
                    HStack(spacing: 16) {
                        
                        Button(action: {}) {
                            
                            Image(systemName: "bookmark.circle")
                                .foregroundColor(.black)
                                .font(.title)
                                .opacity(0.5)
                        }
                        
                        Button(action: {}) {
                            
                            Image(systemName: "bell.circle")
                                .foregroundColor(.black)
                                .font(.title)
                                .opacity(0.5)
                        }
                    }
                }
                
//                Scroll-View(Gener):
                
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(geners, id: \.self) { gener in
                            
                            Button(action: {}) {
                                
                                Rectangle()
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(50)
                                    .opacity(0.05)
                                    .overlay {
                                        
                                        Text(gener)
                                            .font(.footnote)
                                            .bold()
                                            .foregroundColor(.black)
                                            .opacity(0.8)
                                    }
                            }
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                
//                Main feed:
                
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
