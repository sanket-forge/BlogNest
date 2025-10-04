//
//  AuthView.swift
//  BlogNest
//
//  Created by Sanket Khatua on 04/10/25.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .center, spacing: 30) {
                
                VStack(spacing: 10) {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 55)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .shadow(radius: 10)
                        .overlay {
                            
                            TextField("Email", text: $viewModel.email)
                                .padding(.leading)
                        }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 55)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .shadow(radius: 10)
                        .overlay {
                            
                            SecureField("Password", text: $viewModel.password)
                                .padding(.leading)
                        }
                }
                .padding(.top, 80)
                
                VStack(spacing: 22.5) {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 55)
                        .foregroundColor(.cyan)
                        .opacity(0.25)
                        .shadow(radius: 10)
                        .overlay {
                            
                            Button {
                                
                                viewModel.logIn()
                            } label: {
                                
                                Text("Log In")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            }
                            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                                
                                FeedView()
                            }
                            
                        }
                    
                    
                    Text("OR")
                        .font(.caption)
                        .bold()
                        .opacity(0.25)
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 55)
                        .foregroundColor(.brown)
                        .opacity(0.25)
                        .shadow(radius: 10)
                        .overlay {
                            
                            Button {
                                
                                viewModel.signUp()
                            } label: {
                                
                                Text("Sign Up")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            }
                            .navigationDestination(isPresented: $viewModel.isSiggnedUp) {
                                
                                FeedView()
                            }
                        }
                }
                .padding(.top, 25)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 55)
                    .foregroundColor(.brown)
                    .opacity(0.25)
                    .shadow(radius: 10)
                    .overlay {
                        
                        Button {
                            
                            viewModel.signInWithGoogle()
                        } label: {
                            
                            HStack {
                                
                                Image("google")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 20)
                                
                                Text("Continue with Google")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .bold()
                                    .opacity(0.5)
                            }
                        }
                        .navigationDestination(isPresented: $viewModel.isSignedWithGoogle) {
                            
                            FeedView()
                        }
                    }
                
                Text("Forgot Password?")
                    .font(.subheadline)
                    .opacity(0.5)
                    .padding(.top, 30)
            }
            .navigationTitle("Log In")
        }
    }
}

#Preview {
    AuthView()
}
