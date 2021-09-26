//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Nic Deane on 26/9/21.
//

import SwiftUI

struct BackgroundImageView: View {
  var body: some View {
    Image("rocket")
      .antialiased(true)
      .resizable()
      .scaledToFill()
      .ignoresSafeArea(.all)    
  }
}

struct BackgroundImageView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundImageView()
  }
}
