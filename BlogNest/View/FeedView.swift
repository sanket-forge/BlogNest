//
//  FeedView.swift
//  BlogNest
//
//  Created by Sanket Khatua on 12/09/25.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var showingContentView = false
    
    let geners = ["Business", "Politics", "Health", "Food", "Lifestyle", "Travel"]
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
//                Top bar:
                
//                Scroll-View(Gener):
                
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(geners, id: \.self) { gener in
                            
                            Button(action: {}) {
                                
                                Rectangle()
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(50)
                                    .foregroundColor(.cyan)
                                    .opacity(0.25)
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
                
                List {
                    
//                    ForEach will start here....
                    
                    VStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Sanket Khatua")
                                    .font(.callout)
                                    .bold()
                                
                                Text("Tuesday, Sept. 23, 2025")
                                    .font(.footnote)
                                    .opacity(0.5)
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text("This is the rough idea for the main feed i hope it will look good. And i think this look good enough hehehe. Fuck u bitch!!")
                                    .font(.headline)
                            }
                        }
                        
                        HStack(alignment: .center) {
                            
                            Button(action: { showingContentView.toggle() }) {
                                
                                Text("Read more...")
                                    .font(.footnote)
                                    .opacity(0.5)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .sheet(isPresented: $showingContentView) {
                    
                    ContentView()
                }
                
//                Bottom Bar:
                
                Divider()
                
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 45)
                    .foregroundColor(.white)
                    .overlay {
                        
                        HStack {
                            
                            HStack(spacing: 42) {
                                
                                Button(action: {}) {
                                    
                                    Image(systemName: "house.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                }
                                
                                Button(action: {}) {
                                    
                                    Image(systemName: "bell.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                
                                Circle()
                                    .frame(height: 70)
                                    .foregroundColor(.brown)
                                    .shadow(radius: 8, x: 0, y: 4)
                                    .overlay {
                                        
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.white)
                                    }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 42) {
                                
                                Button(action: {}) {
                                    
                                    Image(systemName: "bookmark.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                }
                                
                                Button(action: {}) {
                                    
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                }
                            }
                        }
                        .padding(.all)
                    }
            }
            .navigationTitle("BlogNest")
        }
    }
}

#Preview {
    FeedView()
}
