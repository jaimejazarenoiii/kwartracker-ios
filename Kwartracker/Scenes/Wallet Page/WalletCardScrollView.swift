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
    @State private var cardSize: CGSize = CGSize(width: 225, height: 155)
    @State private var page: Int = 1
    
    // value will be passed as parameter later
    @State private var items: Int = 5
    
    ///https://levelup.gitconnected.com/snap-to-item-scrolling-debccdcbb22f
    init() {
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * cardSize.width + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - cardSize.width) / 2.0)
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: itemSpacing) {
                ForEach(0..<items) { _ in
                    CardView(cardSize: $cardSize)
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
                    let contentWidth: CGFloat = CGFloat(items) * cardSize.width + CGFloat(items - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (cardSize.width + itemSpacing)
                    
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
                    let newOffset = index * cardSize.width
                        + (index - 1) * itemSpacing
                        - (contentWidth / 2.0)
                        + (screenWidth / 2.0)
                        - ((screenWidth - cardSize.width) / 2.0)
                        + itemSpacing
                    
                    // Animate snapping
                    withAnimation {
                        scrollOffset = newOffset
                    }
                })
            )
            PageControl(index: $page, maxIndex: items)
                .padding([.top, .bottom], 30)
        }
    }
}

struct WalletCardScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WalletCardScrollView()
    }
}
