//
//  RatesFluctuationView.swift
//  ExchangeRates
//
//  Created by Rafael Badaró on 02/10/23.
//

import SwiftUI



struct RatesFluctuationView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var searchText = ""
    @State private var isPresentedBaseCurrencyFilter = false
    @State private var isPresentedMultiCurrenciesFilter = false
    
    var searchResult: [RateFluctuationModel] {
        if searchText.isEmpty {
            return viewModel.ratesFluctuation
        } else {
            return viewModel.ratesFluctuation.filter {
                $0.symbol.contains(searchText.uppercased()) ||
                $0.change.formatter(decimalPlaces: 4 ).contains(searchText.uppercased()) ||
                $0.changePct.toPercentage().contains(searchText.uppercased()) ||
                $0.endRate.formatter(decimalPlaces: 2).contains(searchText.uppercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                baseCurrencyPeriodFilterView
                ratesFluctuationListView
            }
            .searchable(text: $searchText)
            .navigationTitle("Conversao de moedas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    isPresentedMultiCurrenciesFilter.toggle()
                } label: {
                    Image(systemName:  "slider.horizontal.3")
                }
                .fullScreenCover(isPresented: $isPresentedMultiCurrenciesFilter) {
                    MultiCurrenciesFilterView()
                }
            }
        }
        .onAppear {
            viewModel.doFetchRatesFluctuation(timeRange: .today)
        }
    }
    
    private var baseCurrencyPeriodFilterView: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                isPresentedBaseCurrencyFilter.toggle()
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
            .fullScreenCover(isPresented: $isPresentedBaseCurrencyFilter, content: {
                BaseCurrencyFilterView()
            })
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
    
    private var ratesFluctuationListView: some View {
        List(searchResult) { fluctuation in
            NavigationLink(
                destination:
                    RatesFluctuationDetailView(
                        baseCurrency: "BRL",
                        rateFluctuation: fluctuation)) {
                            VStack {
                                HStack (alignment: .center, spacing: 8){
                                    Text("\(fluctuation.symbol) / BRL")
                                        .font(.system(size: 14, weight: .medium))
                                    Text(
                                        "\(fluctuation.endRate.formatter(decimalPlaces: 2))"
                                    )
                                    .font(.system(size: 14, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    Text(
                                        "\(fluctuation.change.formatter(decimalPlaces: 4, with: true))"
                                    )
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(fluctuation.change.color)
                                    Text("(\(fluctuation.changePct.toPercentage()))")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(fluctuation.changePct.color)
                                }
                                Divider()
                                    .padding(.leading, -20)
                                    .padding(.trailing, -40)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.white)
            
        }
        .listStyle(.plain)
    }
    
}

struct RatesFluctuationView_Previews: PreviewProvider {
    static var previews: some View {
        RatesFluctuationView()
    }
}
