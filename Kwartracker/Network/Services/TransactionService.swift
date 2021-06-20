//
//  TransactionService.swift
//  Kwartracker
//
//  Created by Jacob on 6/20/21.
//

protocol TransactionServiceDelegate {
    func create()
    func update()
    func delete()
    func getDetail()
}
