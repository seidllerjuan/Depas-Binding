//
//  DepartamentosMainView.swift
//  Departamentes
//
//  Created by WIN603 on 07/10/26.
//
import SwiftUI

struct DepartamentosMainView: View {
    @State var departamentos: [Departamento] = [
        Departamento(ubicacion: "CDMX", imagen: "cdmx", precio: "$2,500 / noche"),
        Departamento(ubicacion: "Cancún", imagen: "cancun", precio: "$3,800 / noche"),
        Departamento(ubicacion: "Guadalajara", imagen: "guadalajara", precio: "$2,100 / noche"),
        Departamento(ubicacion: "Monterrey", imagen: "monterrey", precio: "$2,400 / noche"),
        Departamento(ubicacion: "Puebla", imagen: "puebla", precio: "$1,800 / noche")
    ]

    @State var departamentoReservadoId: UUID? = nil
    @State var mostrarAlerta: Bool = false
    @State var mensajeAlerta: String = ""

    var todosSonFavoritos: Bool {
        for depto in departamentos {
            if !depto.esFavorito {
                return false
            }
        }
        return true
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    if todosSonFavoritos {
                        GroupBox {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Todos han sido marcados")
                                    .bold()
                                    .foregroundColor(.green)
                            }
                        }
                    }

                    Toggle("Marcar todos como favoritos", isOn: Binding(
                        get: {
                            todosSonFavoritos
                        },
                        set: { nuevoValor in
                            for i in 0..<departamentos.count {
                                departamentos[i].esFavorito = nuevoValor
                            }
                        }
                    ))
                    .padding()
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(12)

                    ForEach(departamentos.indices, id: \.self) { index in
                        DepartamentoView(
                            departamento: $departamentos[index],
                            departamentoReservadoId: $departamentoReservadoId,
                            mensajeAlerta: $mensajeAlerta,
                            mostrarAlerta: $mostrarAlerta
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Departamentos")
            .background(Color.gray.opacity(0.1).ignoresSafeArea())
        }
        .alert(isPresented: $mostrarAlerta) {
            Alert(
                title: Text("Notificación"),
                message: Text(mensajeAlerta),
                dismissButton: .default(Text("Aceptar"))
            )
        }
    }
}
