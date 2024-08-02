//
//  ContentView.swift
//  Buttons, Labels, Gradients
//
//  Created by Даниил Ледник on 02.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body : some View {
        VStack {
            //RotatingButton()
            //DeleteButton()
            //RefactorButton()
            //LastButtom()
            Button {
            } label: {
                Text("Привет IOS 15")
            }
            .tint(.purple) // можно использовать вместо background()
            .buttonStyle(.borderedProminent) //меняет стиль кнопки
            .buttonBorderShape(.roundedRectangle(radius: 5)) // можно исполз вместо clipshape
            .controlSize(.large)
            .font(.title)
            }
        }
    }


#Preview {
    ContentView()
}




struct RotatingPlusButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundStyle(.green)
            .font(.title)
            .fontWeight(.bold)
            .clipShape(Circle())
            .rotationEffect(configuration.isPressed ? .degrees(-90) : .degrees(0))
    }
}

struct TextButton: View {
    var body: some View {
        Text("Нажми меня")
            .fontWeight(.medium) // меняем наш шрифт на жирный
            .font(.largeTitle) // делаем наш шрифт под размеры оглавления
            .padding() // создаем первый отступ вокруг текста
            .background(Color.purple) // красим бэкграунд с учетом отступа который создали строчкой выше
            .cornerRadius(40) // скругляем рамку
            .foregroundStyle(.white) // меняем шрифт на белый
            .padding(10) // создаем еще один отступ уже поверх того который создали двумя строчками выше (получается он будет такого же цвета какой он был до покраски и это будет та самая разница от границы которую создадим на следующей строчке и до покрашеного бэкграунда)
            .overlay { RoundedRectangle(cornerRadius: 40)
                //делаем еще один квадрат со скргуленными краями
                    .stroke(.purple, lineWidth: 5)
            }
    }
}

struct ActiveButtonHStack: View {
    var body: some View {
        HStack {
            Text("Удалить")
                .font(.title)
            Image(systemName: "trash")
                .font(.title)
        }
        .padding()
        .foregroundColor(.white)
        .background(.red)
        .cornerRadius(40)
    }
}




    
struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.darkRed , Color.darkBlue]), startPoint: .leading, endPoint: .trailing)) .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    } }

struct DeleteButton: View {
    var body: some View {
        Button(action:
                { print("Нажал кнопку удаления")
        }) {
            Label(
                title:
                    { Text("Удалить")
                            .fontWeight(.semibold)
                        .font(.title) },
                icon:
                    { Image(systemName: "trash")
                        .font(.title) }
            )
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct RefactorButton: View {
    var body: some View {
        Button(action :
                { print("Нажал кнопку Изменить")
        })
        { Label (title :
                    { Text("Изменить")
                .fontWeight(.semibold)
            .font(.title) },
                 icon: { Image(systemName: "square.and.pencil")
            .font(.title) })
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}



struct RotatingButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "plus")
        })
        .buttonStyle(RotatingPlusButton())
    }
}

struct LastButtom: View {
    var body: some View {
        Button(action: {
            print("Нажал кнопку Поделиться")
        }) {
            Label(
                title: {
                    Text("Поделиться")
                        .fontWeight(.semibold)
                        .font(.title)
                }, icon: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                } )
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}
