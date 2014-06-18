//
//  TelaPrincipalViewController.swift
//  Aplicativo de Tarefas
//
//  Created by Hélcio Franco on 16/06/14.
//  Copyright (c) 2014 Hélcio Franco. All rights reserved.
//

import UIKit

class TelaPrincipalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var minhasTarefas: UITableView
    var listaTarefas: Tarefa[] = []
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tarefas"
        
        // Botão Adicionar
        let botaoAdicionar = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "abrirNovaTarefaController:")
        self.navigationItem.rightBarButtonItem = botaoAdicionar
        
        // Delegate + DataSource
        minhasTarefas.delegate = self
        minhasTarefas.dataSource = self
    }
    
    func abrirNovaTarefaController(sender: UIButton!) {
        let novaTarefaController = NovaTarefaViewController(nibName: "NovaTarefaViewController", bundle: nil)
        self.navigationController.pushViewController(novaTarefaController, animated: true)
    }
    
    // Retorna o número de linhas de acordo com número de elementos na Array de Tarefas
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // Número de elementos na nossa Array
        return self.listaTarefas.count
    }
    
    // Exibe nossa célula contendo o nome da tarefa
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var tarefa = tableView.dequeueReusableCellWithIdentifier("tarefa") as? UITableViewCell
        
        if !tarefa {
            tarefa = UITableViewCell(style: .Value1, reuseIdentifier: "tarefa")
        }
        
        // Recupera o objeto tarefa
        let minhaTarefa: Tarefa = self.listaTarefas[indexPath.row]
        
        // Verifica se a tarefa já foi executada
        if minhaTarefa.executada {
            tarefa!.accessoryType = .Checkmark
        } else {
            tarefa!.accessoryType = .None
        }
        
        // Escreve o nome da tarefa na propriedade "text" da label da célula
        tarefa!.textLabel.text = minhaTarefa.tarefaNome
        
        // Retorna a célula tarefa
        return tarefa
    }
    
    // Método chamado no toque da célula
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        // Remove o "highlight" da célula
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        // Recupera o objeto tarefa
        let tarefaExecutada: Tarefa = self.listaTarefas[indexPath.row]
        
        // Faz a negação do estado Bool da tarefa (true/false utilizando o operador "!")
        tarefaExecutada.executada = !tarefaExecutada.executada
        
        // Atualiza a UITableView para exibir a nova marcação
        minhasTarefas.reloadData()
    }
    
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle!, forRowAtIndexPath indexPath: NSIndexPath!) {
        println(editingStyle)
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
