//
//  ContentView.swift
//  BlogNest
//
//  Created by Sanket Khatua on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            
            VStack(alignment: .center) {
                
                Text("Sanket Khatua")
                    .font(.callout)
                    .bold()
                
                Text("Tuesday, Sept. 23, 2025")
                    .font(.footnote)
                    .opacity(0.5)
            }
            
//            Content:
            
            VStack(alignment: .leading) {
                
                Text("Alright this is the heading of the main content.")
                    .font(.headline)
                
                ScrollView {
                    
                    Text("This is the main content so you can consume all the info here so yes fuck off!!")
                }
            }
            
            Spacer()
            
//            Bottom bar:
            
            HStack {
                
                HStack(spacing: 30) {
                    
                    Button(action: {}) {
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                    
                    Button(action: {}) {
                        
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .opacity(0.5)
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
