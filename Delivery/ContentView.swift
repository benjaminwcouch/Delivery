//
//  ContentView.swift
//  Delivery
//
//  Created by Benjamin Couch on 7/7/2024.
//
import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    let totalPages = 3
    
    init() {
        // Reset currentPage to 1 for debugging purposes or first-time launch
        // This line can be removed or commented out once you are done debugging
        currentPage = 1
    }
    
    var body: some View {
        VStack {
            Text("Current Page: \(currentPage)") // Debugging text to verify currentPage value
                .font(.headline)
                .padding()
            if currentPage > totalPages {
                Home()
            } else {
                OnboardingScreen(totalPages: totalPages)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        VStack {
            Text("Welcome to Home Screen")
                .font(.title)
                .fontWeight(.heavy)
            Text("Please like and Subscribe!")
                .font(.body)
                .fontWeight(.medium)
        }
    }
}

// OnboardingScreen

struct OnboardingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    let totalPages: Int
    
    var body: some View {
        ZStack {
            if currentPage == 1 {
                ScreenView(image: "food", title: "Order Food", details: "", totalPages: totalPages)
            } else if currentPage == 2 {
                ScreenView(image: "payment", title: "Easy Payment", details: "", totalPages: totalPages)
            } else if currentPage == 3 {
                ScreenView(image: "delivery", title: "Fast Delivery", details: "", totalPages: totalPages)
            }
        }
    }
}

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var details: String
    let totalPages: Int
    
    var body: some View {
        VStack {
            HStack {
                if currentPage == 1 {
                    Text("Hello Foodies!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        currentPage -= 1
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black)
                            .opacity(0.4)
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                 
                    currentPage = totalPages + 1
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .padding()
            .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength: 80)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(Color("Color"))
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
            
            Spacer(minLength: 0)
            
            HStack {
                if currentPage == 1 {
                    Color("Color").frame(height: 10 / UIScreen.main.scale)
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                }
                
                if currentPage == 2 {
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                    Color("Color").frame(height: 10 / UIScreen.main.scale)
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                }
                
                else if currentPage == 3 {
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                    Color.gray.frame(height: 10 / UIScreen.main.scale)
                    Color("Color").frame(height: 10 / UIScreen.main.scale)
                }
            }
                
                Button(action: {
                if currentPage < totalPages {
                    currentPage += 1
                } else {
                    currentPage = totalPages + 1
                }
            }, label: {
                if currentPage == totalPages {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                } else {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                }
            })
        }
    }
}
