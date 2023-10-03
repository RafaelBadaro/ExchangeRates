//
//  RatesFluctuationView.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 02/10/23.
//

import SwiftUI

struct Fluctuation: Identifiable {
    let id = UUID()
    var symbol: String
    var change: Double
    var changePct: Double
    var endRate: Double
}

class FluctuationViewModel: ObservableObject {
    @Published var fluctuations: [Fluctuation] = [
        Fluctuation (symbol: "USD", change: 0.0008, changePct: 0.4175,
                     endRate: 0.18857),
        Fluctuation (symbol: "EUR", change: 0.0003, changePct: 0.1651,
                     endRate: 0.181353),
        Fluctuation (symbol: "GBP", change: -0.0001, changePct: -0.0403,
                     endRate: 0.158915)
    ]
    
}

struct RatesFluctuationView: View {
    
    @StateObject var viewModel = FluctuationViewModel()
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            VStack{
                baseCurrencyPeriodFilterView
            }
            .searchable(text: $searchText)
            .navigationTitle("Conversao de moedas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    print("Filtrar moedas")
                } label: {
                    Image(systemName:  "slider.horizontal.3")
                }
            }
        }
    }
    
    private var baseCurrencyPeriodFilterView: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                print("Filtrar moeda base")
            } label: {
                Text("BRL")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 1)
                    )
            }
            .background(Color(UIColor.lightGray))
            .cornerRadius(8)
            
            Button{
                print("1 dia")
            } label: {
                Text("1 dia")
                    .font(.system(size:14, weight: .bold))
                    .foregroundColor(.blue)
                    .underline()
            }
            
            Button{
                print("7 dias")
            } label: {
                Text("7 dias")
                    .font(.system(size:14, weight: .bold))
                    .foregroundColor(.gray)
            }
            
            Button{
                print("1 mes")
            } label: {
                Text("1 mes")
                    .font(.system(size:14, weight: .bold))
                    .foregroundColor(.gray)
            }
            
            Button{
                print("6 meses")
            } label: {
                Text("6 meses")
                    .font(.system(size:14, weight: .bold))
                    .foregroundColor(.gray)
            }
            
            Button{
                print("1 ano")
            } label: {
                Text("1 ano")
                    .font(.system(size:14, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 16)
        
    }
}

struct RatesFluctuationView_Previews: PreviewProvider {
    static var previews: some View {
        RatesFluctuationView()
    }
}
