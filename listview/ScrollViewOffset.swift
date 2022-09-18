//
//  ScrollViewOffset.swift
//  listview
//
//  Created by Muhammad Aqib on 06/07/2021.
//

import SwiftUI

struct ScrollViewOffset<Content: View>: View {
  let onOffsetChange: (CGFloat) -> Void
  let content: () -> Content

  init(
    onOffsetChange: @escaping (CGFloat) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onOffsetChange = onOffsetChange
    self.content = content
  }

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      offsetReader
      content()
        .padding(.top, -8)
      // 👆🏻 this places the real content as if our `offsetReader` was
      // not there.
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }
    
    var offsetReader: some View {
        GeometryReader { proxy in
          Color.clear
            .preference(
              key: OffsetPreferenceKey.self,
              value: proxy.frame(in: .named("frameLayer")).minY
            )
        }
        .frame(height: 0)
        // this makes sure that the reader doesn't affect the content height
      }
}

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {} // Just required to conform to PreferenceKey protocol
}
