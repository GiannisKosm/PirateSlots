//
//  CardView.swift
//  Slots
//
//  Created by Ioannis Kosmopoulos on 21/1/21.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    @Binding var back: Color
    
    var body: some View {
        
        Image(symbol)
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .background(back.opacity(0.5))
            .cornerRadius(20)

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), back: Binding.constant(Color.green))
    }
}
