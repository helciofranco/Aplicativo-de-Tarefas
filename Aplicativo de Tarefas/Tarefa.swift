//
//  Tarefa.swift
//  Aplicativo de Tarefas
//
//  Created by Hélcio Franco on 17/06/14.
//  Copyright (c) 2014 Hélcio Franco. All rights reserved.
//

import UIKit

class Tarefa: NSObject {
    
    var criacaoData: NSDate
    var tarefaNome: String
    var executada: Bool
    
    init(nome:String){
        self.tarefaNome = nome
        self.criacaoData = NSDate()
        self.executada = false
    }
}
