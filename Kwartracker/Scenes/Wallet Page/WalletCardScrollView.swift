//
//  WalletCardScrollView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/23/21.
//

import SwiftUI

struct WalletCardScrollView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    @State private var itemSpacing: CGFloat = 20
    @State private var itemWidth: CGFloat = 225
    @State private var items: Int = 5
    @State private var page: Int = 1
    
    ///https://levelup.gitconnected.com/snap-to-item-scrolling-debccdcbb22f
    init() {
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: itemSpacing) {
                ForEach(0..<items) { _ in
                    CardView()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // Scroll to where user dragged
                    scrollOffset += event.translation.width
                    dragOffset = 0
                    
                    // Now calculate which item to snap to
                    let contentWidth: CGFloat = CGFloat(items) * 228 + CGFloat(items - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                    
                    // Should we stay at current index or are we closer to the next item...
                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }
                    // Protect from scrolling out of bounds
                    index = min(index, CGFloat(items) - 1)
                    index = max(index, 0)
                    
                    page = abs(Int(index - CGFloat(items)))
                    
                    // Set final offset (snapping to item)
                    let newOffset = index * itemWidth
                        + (index - 1) * itemSpacing
                        - (contentWidth / 2.0)
                        + (screenWidth / 2.0)
                        - ((screenWidth - itemWidth) / 2.0)
                        + itemSpacing
                    
                    // Animate snapping
                    withAnimation {
                        scrollOffset = newOffset
                    }
                })
            )
            PageControl(index: $page, maxIndex: items)
        }
    }
}

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int

    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...maxIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(index == self.index ?
                            Color(Asset.Colors.mintGreen.name) :
                            Color(Asset.Colors.solitudeGrey.name))
                    .frame(width: index == self.index ? 20 : 10,
                           height: 10)
            }
        }
        .padding(15)
    }
}

struct WalletCardScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WalletCardScrollView()
    }
}
