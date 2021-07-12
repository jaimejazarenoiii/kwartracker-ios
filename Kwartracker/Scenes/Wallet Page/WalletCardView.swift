//
//  WalletCardView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/23/21.
//

import SwiftUI

struct WalletCardView<TransactionView: View>: View {
    @EnvironmentObject var store: AppStore
    @State private var scrollOffset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    @State internal var page: Int = 1
    @State private var showTargetView: Bool = false
    @State internal var editToggle: Bool = false
    
    private let transactionView: ([Transaction]) -> TransactionView
    internal let iconColor: String = Asset.Colors.spindleGrey.name
    internal let editIconName: String = Asset.Images.editIcon.name
    internal let editLabel: String = L10n.Wallet.ActionButton.editWallet
    internal let addTransactionIcon: String = Asset.Images.addIcon.name
    internal let addTransactionLabel: String = L10n.Wallet.ActionButton.addTransaction
    internal let buttonSize: CGFloat = 10
    internal let padding: CGFloat = 10
    internal let fontSize: CGFloat = 12
    
    private var baseSize: CGSize = CGSize(width: 238, height: 155)
    private var itemSpacing: CGFloat = 20
    private var margin: CGFloat = 30
    private var cardSize: CGSize = .zero
    var wallets = [Wallet]()
    
    private var transactions: [Transaction] {
        if wallets.count > 0 {
            return wallets[page - 1].transactions
        }
        return [Transaction]()
    }
    
    ///https://levelup.gitconnected.com/snap-to-item-scrolling-debccdcbb22f
    init(
        wallets: [Wallet],
        @ViewBuilder transactionView: @escaping([Transaction]) -> TransactionView
    ) {
        self.transactionView = transactionView
        let maxWidth: CGFloat = 238
        let calculatedWidth = UIScreen.main.bounds.width * 0.65
        let newWidth = maxWidth < calculatedWidth ? maxWidth : calculatedWidth
        let calculatedHeight = self.setHeightRatio(width: newWidth,
                                                   baseSize: baseSize)
        self.cardSize = CGSize(width: newWidth,
                                height: calculatedHeight)
        self.wallets = wallets
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(wallets.count) * cardSize.width +
            CGFloat(wallets.count - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - cardSize.width) / 2.0)
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: itemSpacing) {
                ForEach(wallets, id: \.id) { wallet in
                    CardView(size: cardSize, wallet: wallet)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                })
                .onEnded({ event in
                    
                    // Animate snapping
                    let newOffset = animateScroll(with: event)
                    withAnimation {
                        scrollOffset = newOffset
                    }
                })
            )
            
            CardPageControlView(index: $page, maxIndex: wallets.count)
                    .padding([.top, .bottom], margin)
            
            if !wallets.isEmpty {
                WalletActionButtonView
            }
            
            Spacer()
                .frame(height: margin)
            
            if showTargetView {
                CardTargetView(wallet: wallets[page - 1])
            }
        }
        
        self.transactionView(transactions)
    }
    
    func animateScroll(with event: DragGesture.Value) -> CGFloat {
        // Scroll to where user dragged
        scrollOffset += event.translation.width
        dragOffset = 0
        
        // Now calculate which item to snap to
        let contentWidth: CGFloat = CGFloat(wallets.count) *
            cardSize.width + CGFloat(wallets.count - 1) * itemSpacing
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
        index = min(index, CGFloat(wallets.count) - 1)
        index = max(index, 0)
        
        page = abs(Int(index - CGFloat(wallets.count)))
        let type = wallets[page - 1].type
        showTargetView = (type == WalletType.goal)
        
        // Set final offset (snapping to item)
        let newOffset = index * cardSize.width
            + (index - 1) * itemSpacing
            - (contentWidth / 2.0)
            + (screenWidth / 2.0)
            - ((screenWidth - cardSize.width) / 2.0)
            + itemSpacing
        
        return newOffset
    }
}
