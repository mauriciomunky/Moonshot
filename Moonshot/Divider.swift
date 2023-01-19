//
//  Divider.swift
//  Moonshot
//
//  Created by Maurício Costa on 18/01/23.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle().frame(height:2).foregroundColor(.lightBackground).padding(.vertical)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
