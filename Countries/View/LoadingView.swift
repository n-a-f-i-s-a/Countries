//
//  LoadingView.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .frame(height: 200)
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
