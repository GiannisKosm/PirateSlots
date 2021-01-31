//
//  ContentView.swift
//  Slots
//
//  Created by Ioannis Kosmopoulos on 21/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["pirate2big","pirate3big","parrotbig","jolly-roger","treasure-map","skull","pirate-ship"]
    //@State private var symbols = ["pirate2big","pirate3big"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 100.0
    @State private var won = 0.0
    @State private var back = Array(repeating: Color.white, count: 9)
    @State private var betAmount = 10.0
    @State private var showPopUp: Bool = false
    @ObservedObject var audioPlayer = AudioPlayer()

    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 153/255, green: 204/255, blue: 255/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color(red: 204/255, green: 229/255, blue: 255/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Spacer()
                
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    
                    Text("Pirate Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }
                .scaleEffect(2)
                
                Spacer()
                HStack{
                //credits counter
                Text("Credit: " + String(credits)+"€")
                    .foregroundColor(.black)
                    .padding(.all)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Text("Won:" + String(won) + "€")
                    .foregroundColor(.black)
                    .padding(.all)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                }
                Spacer()
                VStack{
                    
                    //Cards
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[0]], back: $back[0])
                        CardView(symbol: $symbols[numbers[1]], back: $back[1])
                        CardView(symbol: $symbols[numbers[2]], back: $back[2])
                    
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], back: $back[3])
                        CardView(symbol: $symbols[numbers[4]], back: $back[4])
                        CardView(symbol: $symbols[numbers[5]], back: $back[5])

                        Spacer()

                        
                    }
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], back: $back[6])
                        CardView(symbol: $symbols[numbers[7]], back: $back[7])
                        CardView(symbol: $symbols[numbers[8]], back: $back[8])
                    
                        Spacer()

                        
                    }
                    
                    
                }
              
                Spacer()
               
                HStack{
                //Button
                    
                Button(action: {
                    
        
                    if self.credits < self.betAmount {
                        print("error")
                        showPopUp.toggle()
                    }
                    
                    else {

                        self.audioPlayer.startPlayback(fileName: "coin-drop-5", fileExtension: "mp3")

                   
                  
                    self.back = self.back.map {
                        _ in Color.white
                    }
                    
                    // random images
                    
                    self.numbers = self.numbers.map{
                        _ in Int.random(in: 0...symbols.count - 1)
                    }
                   
                   
                    //check for win
                   
                   
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
                        //won
                        if self.symbols[numbers[0]] ==  "treasure-map" && self.symbols[numbers[1]] == "treasure-map" && self.symbols[numbers[2]] == "treasure-map" {
                            self.credits += betAmount * 200
                            self.won = betAmount * 200
                        }
                        else if self.symbols[numbers[0]] ==  "skull" && self.symbols[numbers[1]] == "skull" && self.symbols[numbers[2]] == "skull" {
                            self.credits += betAmount * 50
                            self.won = betAmount * 50
                            }
                        else if self.symbols[numbers[0]] ==  "pirate3big" && self.symbols[numbers[1]] == "pirate3big" && self.symbols[numbers[2]] == "pirate3big" {
                            self.credits += betAmount * 5
                            self.won = betAmount * 5
                            }
                        else if self.symbols[numbers[0]] ==  "pirate2big" && self.symbols[numbers[1]] == "pirate2big" && self.symbols[numbers[2]] == "pirate2big" {
                            self.credits += betAmount * 2
                            self.won = betAmount * 2
                            }
                        else if self.symbols[numbers[0]] ==  "pirate-ship" && self.symbols[numbers[1]] == "pirate-ship" && self.symbols[numbers[2]] == "pirate-ship" {
                            self.credits += betAmount * 1
                            self.won = betAmount * 1
                            }
                        else if self.symbols[numbers[0]] ==  "parrotbig" && self.symbols[numbers[1]] == "parrotbig" && self.symbols[numbers[2]] == "parrotbig" {
                            self.credits += betAmount * 0.5
                            self.won = betAmount * 0.5
                            }
                        else if self.symbols[numbers[0]] ==  "jolly-roger" && self.symbols[numbers[1]] == "jolly-roger" && self.symbols[numbers[2]] == "jolly-roger" {
                            self.credits += betAmount * 0.5
                            self.won = betAmount * 0.5
                            }
                        
                        
                        //back to green
                        self.back[0] = Color.green
                        self.back[1] = Color.green
                        self.back[2] = Color.green

                        
                        
                    }
                        else if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] {
                            
                            if self.symbols[numbers[3]] ==  "treasure-map" && self.symbols[numbers[4]] == "treasure-map" && self.symbols[numbers[5]] == "treasure-map" {
                            self.credits += betAmount * 200
                            self.won = betAmount * 200
                            }
                            else if self.symbols[numbers[3]] ==  "skull" && self.symbols[numbers[4]] == "skull" && self.symbols[numbers[5]] == "skull" {
                                self.credits += betAmount * 50
                                self.won = betAmount * 50
                                }
                            else if self.symbols[numbers[3]] ==  "pirate3big" && self.symbols[numbers[4]] == "pirate3big" && self.symbols[numbers[5]] == "pirate3big" {
                                self.credits += betAmount * 5
                                self.won = betAmount * 5
                                }
                            else if self.symbols[numbers[3]] ==  "pirate2big" && self.symbols[numbers[4]] == "pirate2big" && self.symbols[numbers[5]] == "pirate2big" {
                                self.credits += betAmount * 2
                                self.won = betAmount * 2
                                }
                            else if self.symbols[numbers[3]] ==  "pirate-ship" && self.symbols[numbers[4]] == "pirate-ship" && self.symbols[numbers[5]] == "pirate-ship" {
                                self.credits += betAmount * 1
                                self.won = betAmount * 1
                                }
                            else if self.symbols[numbers[3]] ==  "parrotbig" && self.symbols[numbers[4]] == "parrotbig" && self.symbols[numbers[5]] == "parrotbig" {
                                self.credits += betAmount * 0.5
                                self.won = betAmount * 0.5
                                }
                            else if self.symbols[numbers[0]] ==  "jolly-roger" && self.symbols[numbers[1]] == "jolly-roger" && self.symbols[numbers[2]] == "jolly-roger" {
                                self.credits += betAmount * 0.5
                                self.won = betAmount * 0.5
                                }
                            
                            //back to green
                            self.back[3] = Color.green
                            self.back[4] = Color.green
                            self.back[5] = Color.green
                            
                        }
                        
                        else if self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8] {
                         
                            if self.symbols[numbers[6]] ==  "treasure-map" && self.symbols[numbers[7]] == "treasure-map" && self.symbols[numbers[8]] == "treasure-map" {
                            self.credits += betAmount * 200
                            self.won = betAmount * 200
                            }
                            else if self.symbols[numbers[6]] ==  "skull" && self.symbols[numbers[7]] == "skull" && self.symbols[numbers[8]] == "skull" {
                                self.credits += betAmount * 50
                                self.won = betAmount * 50
                                }
                            else if self.symbols[numbers[6]] ==  "pirate3big" && self.symbols[numbers[7]] == "pirate3big" && self.symbols[numbers[8]] == "pirate3big" {
                                self.credits += betAmount * 5
                                self.won = betAmount * 5
                                }
                            else if self.symbols[numbers[6]] ==  "pirate2big" && self.symbols[numbers[7]] == "pirate2big" && self.symbols[numbers[8]] == "pirate2big" {
                                self.credits += betAmount * 2
                                self.won = betAmount * 2
                                }
                            else if self.symbols[numbers[6]] ==  "pirate-ship" && self.symbols[numbers[7]] == "pirate-ship" && self.symbols[numbers[8]] == "pirate-ship" {
                                self.credits += betAmount * 1
                                self.won = betAmount * 1
                                }
                            else if self.symbols[numbers[6]] ==  "parrotbig" && self.symbols[numbers[7]] == "parrotbig" && self.symbols[numbers[8]] == "parrotbig" {
                                self.credits += betAmount * 0.5
                                self.won = betAmount * 0.5
                                }
                            else if self.symbols[numbers[6]] ==  "jolly-roger" && self.symbols[numbers[7]] == "jolly-roger" && self.symbols[numbers[8]] == "jolly-roger" {
                                self.credits += betAmount * 0.5
                                self.won = betAmount * 0.5
                                }
                            
                            
                            //back to green
                            self.back[6] = Color.green
                            self.back[7] = Color.green
                            self.back[8] = Color.green
                            
                        }
                        
                        else if self.numbers[0] == self.numbers[4] && self.numbers[4] == self.numbers[8]{
                            
                            if self.symbols[numbers[0]] ==  "treasure-map" && self.symbols[numbers[4]] == "treasure-map" && self.symbols[numbers[8]] == "treasure-map" {
                            self.credits += betAmount * 200 * 5
                            self.won = betAmount * 200 * 5
                            }
                            else if self.symbols[numbers[0]] ==  "skull" && self.symbols[numbers[4]] == "skull" && self.symbols[numbers[8]] == "skull" {
                                self.credits += betAmount * 50 * 5
                                self.won = betAmount * 50 * 5
                                }
                            else if self.symbols[numbers[0]] ==  "pirate3big" && self.symbols[numbers[4]] == "pirate3big" && self.symbols[numbers[8]] == "pirate3big" {
                                self.credits += betAmount * 5 * 5
                                self.won = betAmount * 5 * 5
                                }
                            else if self.symbols[numbers[0]] ==  "pirate2big" && self.symbols[numbers[4]] == "pirate2big" && self.symbols[numbers[8]] == "pirate2big" {
                                self.credits += betAmount * 2 * 5
                                self.won = betAmount * 2 * 5
                                }
                            else if self.symbols[numbers[0]] ==  "pirate-ship" && self.symbols[numbers[4]] == "pirate-ship" && self.symbols[numbers[8]] == "pirate-ship" {
                                self.credits += betAmount * 1 * 5
                                self.won = betAmount * 1 * 5
                                }
                            else if self.symbols[numbers[0]] ==  "parrotbig" && self.symbols[numbers[4]] == "parrotbig" && self.symbols[numbers[8]] == "parrotbig" {
                                self.credits += betAmount * 0.5 * 5
                                self.won = betAmount * 0.5 * 5
                                }
                            else if self.symbols[numbers[0]] ==  "jolly-roger" && self.symbols[numbers[4]] == "jolly-roger" && self.symbols[numbers[8]] == "jolly-roger"{
                                self.credits += betAmount * 0.25 * 5
                                self.won = betAmount * 0.25 * 5
                            }

                            
                            //back to green
                            self.back[0] = Color.green
                            self.back[4] = Color.green
                            self.back[8] = Color.green
                        }
                        else if self.numbers[6] == self.numbers[4] && self.numbers[4] == self.numbers[2]{
                            
                            if self.symbols[numbers[6]] ==  "treasure-map" && self.symbols[numbers[4]] == "treasure-map" && self.symbols[numbers[2]] == "treasure-map" {
                            self.credits += betAmount * 200 * 4
                            self.won = betAmount * 200 * 4
                            }
                            else if self.symbols[numbers[6]] ==  "skull" && self.symbols[numbers[4]] == "skull" && self.symbols[numbers[2]] == "skull" {
                                self.credits += betAmount * 50 * 4
                                self.won = betAmount * 50 * 4
                                }
                            else if self.symbols[numbers[6]] ==  "pirate3big" && self.symbols[numbers[4]] == "pirate3big" && self.symbols[numbers[2]] == "pirate3big" {
                                self.credits += betAmount * 5 * 4
                                self.won = betAmount * 5 * 4
                                }
                            else if self.symbols[numbers[6]] ==  "pirate2big" && self.symbols[numbers[4]] == "pirate2big" && self.symbols[numbers[2]] == "pirate2big" {
                                self.credits += betAmount * 2 * 4
                                self.won = betAmount * 2 * 4
                                }
                            else if self.symbols[numbers[6]] ==  "pirate-ship" && self.symbols[numbers[4]] == "pirate-ship" && self.symbols[numbers[2]] == "pirate-ship" {
                                self.credits += betAmount * 1 * 4
                                self.won = betAmount * 1 * 4
                                }
                            else if self.symbols[numbers[6]] ==  "parrotbig" && self.symbols[numbers[4]] == "parrotbig" && self.symbols[numbers[2]] == "parrotbig" {
                                self.credits += betAmount * 0.5 * 4
                                self.won = betAmount * 0.5 * 4
                                }
                            else if self.symbols[numbers[6]] ==  "jolly-roger" && self.symbols[numbers[4]] == "jolly-roger" && self.symbols[numbers[2]] == "jolly-roger" {
                                self.credits += betAmount * 0.25 * 4
                                self.won = betAmount * 0.25 * 4
                            }

                            
                            //back to green
                            self.back[6] = Color.green
                            self.back[4] = Color.green
                            self.back[2] = Color.green
                        }
                        
                        else if self.numbers[0] == self.numbers[4] && self.numbers[4] == self.numbers[8] && self.numbers[8] == self.numbers[6] && self.numbers[6] == self.numbers[2] {
                            
                            if self.symbols[numbers[0]] == "treasure-map" && self.symbols[numbers[4]] == "treasure-map" && self.symbols[numbers[8]] == "treasure-map" && self.symbols[numbers[6]] == "treasure-map" && self.symbols[numbers[2]] == "treasure-map" {
                                
                                self.credits += betAmount * 200 * 6
                                self.won = betAmount * 200 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "skull" && self.symbols[numbers[4]] == "skull" && self.symbols[numbers[8]] == "skull" && self.symbols[numbers[6]] == "skull" && self.symbols[numbers[2]] == "skull" {
                                
                                self.credits += betAmount * 50 * 6
                                self.won = betAmount * 50 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "pirate3big" && self.symbols[numbers[4]] == "pirate3big" && self.symbols[numbers[8]] == "pirate3big" && self.symbols[numbers[6]] == "pirate3big" && self.symbols[numbers[2]] == "pirate3big" {
                                
                                self.credits += betAmount * 5 * 6
                                self.won = betAmount * 5 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "pirate2big" && self.symbols[numbers[4]] == "pirate2big" && self.symbols[numbers[8]] == "pirate2big" && self.symbols[numbers[6]] == "pirate2big" && self.symbols[numbers[2]] == "pirate2big" {
                                
                                self.credits += betAmount * 2 * 6
                                self.won = betAmount * 2 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "pirate-ship" && self.symbols[numbers[4]] == "pirate-ship" && self.symbols[numbers[8]] == "pirate-ship" && self.symbols[numbers[6]] == "pirate-ship" && self.symbols[numbers[2]] == "pirate-ship" {
                                
                                self.credits += betAmount * 1 * 6
                                self.won = betAmount * 1 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "parrotbig" && self.symbols[numbers[4]] == "parrotbig" && self.symbols[numbers[8]] == "parrotbig" && self.symbols[numbers[6]] == "parrotbig" && self.symbols[numbers[2]] == "parrotbig" {
                                
                                self.credits += betAmount * 0.5 * 6
                                self.won = betAmount * 200 * 6
                                
                            }
                            else if self.symbols[numbers[0]] == "jolly-roger" && self.symbols[numbers[4]] == "jolly-roger" && self.symbols[numbers[8]] == "jolly-roger" && self.symbols[numbers[6]] == "jolly-roger" && self.symbols[numbers[2]] == "jolly-roger" {
                                
                                self.credits += betAmount * 0.25 * 6
                                self.won = betAmount * 0.25 * 6
                                
                            }
                            

                            
                            //back to green
                            self.back[4] = Color.green
                            self.back[0] = Color.green
                            self.back[8] = Color.green
                            self.back[6] = Color.green
                            self.back[2] = Color.green
                        }
                        
                        else if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] && self.numbers[2] == self.numbers[3] && self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] && self.numbers[5] == self.numbers[6] && self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8] {
                            
                            self.credits += betAmount * 1000
                            self.won = betAmount * 1000


                            self.back = self.back.map{
                                _ in Color.green
                            }
                            
                        }
                        
                   
                    
                    else {
                       
                        self.credits -=  self.betAmount
                        self.won = 0
                    }
                    
                    }
                    
                })
                {
                    
                    Text("Spin")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding([.leading, .trailing], 30)
                    .background(Color.pink)
                    .cornerRadius(20)
                        
                    
                }

                }
                Spacer()
                HStack{
                    Spacer()
                    Stepper(value: $betAmount, in: 0.50...20, step: 0.50){
                
                    //.padding(.all)
                    //.background(Color.white.opacity(0.5))
                    //.cornerRadius(20)

                Text("Bet:" + String(betAmount) + "€")
                        .foregroundColor(.black)
                        .padding(.all)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                        Spacer()


                }
                    .padding(.all)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    Spacer()

                    
                }

            }
            SwiftUIView(title: "Not Enough Money", message: "Change the value of bet or add money! Arggg", buttonText: "OK", show: $showPopUp)
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

