//
//  EstiloBorde.swift
//  Departamentes
//
//  Created by WIN603 on 07/10/26.
//

import SwiftUI

struct EstiloBorde: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}
