//
//  CheckoutView.swift
//  iDine
//
//  Created by Student on 9/1/21.
//

import SwiftUI

struct CheckoutView: View {
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [0, 10, 15, 20, 25]
    let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var pickupTime = "Now"
    @State private var showingPaymentAlert = false
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card",
                       isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                TextField("Enter your iDine ID",
                          text: $loyaltyNumber)
                }
            }
            Section(header: Text("Pickup time")){
                Picker("time:", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total: \(totalPrice)")
                        .font(.largeTitle)){
                Button("Confirm order"){
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
