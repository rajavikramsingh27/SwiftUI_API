//
//  LoginWithNumber.swift
//  SwiftUI_API
//
//  Created by GranzaX on 12/10/22.
//

import SwiftUI
import CountryPickerView


struct LoginWithNumber: View {
    @State private var selections:Country!
    
    @State private var selectedArray = [
            ["1", "2", "3", "4", "5"],
            ["Consider long text her: word1, word2, word3, word4, word5", "7", "8", "9", "10"],
            ["11", "12", "13", "14", "15"]
        ]
    
    var body: some View {
        VStack {
            CountryPicker(selections: $selections).frame(height: 50)
                .padding()
            Rectangle()
                .frame(height: 1.6, alignment: .bottom)
                .foregroundColor(Color.blue)
            
            Button {
                print(selections.phoneCode)
            } label: {
                Text("Submit")
            }

        }
    }
}

struct LoginWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithNumber()
    }
}

struct CustomPicker: UIViewRepresentable {
    @Binding var dataArrays : [[String]]

    //makeCoordinator()
    func makeCoordinator() -> CustomPicker.Coordinator {
        return CustomPicker.Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<CustomPicker>) {
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CustomPicker
        init(_ pickerView: CustomPicker) {
            self.parent = pickerView
        }

        //Number Of Components:
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.dataArrays.count
        }

        //Number Of Rows In Component:
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.dataArrays[component].count
        }

        //Width for component:
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return UIScreen.main.bounds.width/3
        }

        //Row height:
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60
        }

        //View for Row
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: 60))

            let pickerLabel = UILabel(frame: view.bounds)

            pickerLabel.text = parent.dataArrays[component][row]

            pickerLabel.adjustsFontSizeToFitWidth = true
            pickerLabel.textAlignment = .center
            pickerLabel.lineBreakMode = .byWordWrapping
            pickerLabel.numberOfLines = 0

            view.addSubview(pickerLabel)

            view.clipsToBounds = true
            view.layer.cornerRadius = view.bounds.height * 0.1
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor.black.cgColor

            return view
        }
    }
}

struct CountryPicker: UIViewRepresentable {
    @Binding var selections: Country!
    
    class Coordinator: NSObject, CountryPickerViewDelegate, CountryPickerViewDataSource {
        
        var parent: CountryPicker
        
        init(_ pickerView: CountryPicker) {
            self.parent = pickerView
        }
        
        func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
            print(country.code)
            print(country.phoneCode)
            print(country.flag)
            
            self.parent.selections = country
        }
        
    }
    
    //makeCoordinator()
    func makeCoordinator() -> CountryPicker.Coordinator {
        return CountryPicker.Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<CountryPicker>) -> CountryPickerView {
        let countryPicker = CountryPickerView(frame: .zero)
        countryPicker.backgroundColor = .clear
        countryPicker.showPhoneCodeInView = true
        countryPicker.showCountryCodeInView = true
        countryPicker.showCountryNameInView = false
        countryPicker.font = UIFont (name: "times new roman", size: 30)!
        countryPicker.textColor = UIColor.blue
        
        countryPicker.delegate = context.coordinator
        countryPicker.dataSource = context.coordinator
        
        return countryPicker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: CountryPickerView, context: UIViewRepresentableContext<CountryPicker>) {
        
    }

}
