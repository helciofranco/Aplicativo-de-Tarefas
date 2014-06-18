//
//  NovaTarefaViewController.swift
//  Aplicativo de Tarefas
//
//  Created by Hélcio Franco on 17/06/14.
//  Copyright (c) 2014 Hélcio Franco. All rights reserved.
//

import UIKit

class NovaTarefaViewController: UIViewController {

    @IBOutlet var campoTarefa: UITextField
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nova Tarefa"
        
        // Botão Concluir
        let botaoConcluir = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "adicionarTarefa:")
        self.navigationItem.rightBarButtonItem = botaoConcluir
    }
    
    func adicionarTarefa(sender: UIButton!) {
        if !campoTarefa.text.isEmpty {
            // Insere um modelo de Tarefa na Array de Tarefas
            let controllerPrincipal = self.navigationController.viewControllers[0] as TelaPrincipalViewController
            controllerPrincipal.listaTarefas.append(Tarefa(nome: campoTarefa.text))
            
            // Atualiza a UITableView para exibir a nova tarefa
            controllerPrincipal.minhasTarefas.reloadData()
            
            // Volta à lista de tarefas
            self.navigationController.popViewControllerAnimated(true)
        } else {
            // Instancia uma UIAlertController
            var alerta = UIAlertController(title: "Ops!", message: "Digite alguma coisa.", preferredStyle: UIAlertControllerStyle.Alert)
           
            // Adiciona o botão "Ok" que cancela o alerta
            alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))

            // Coloca o alerta na tela
            self.presentViewController(alerta, animated: true, completion: nil)
        }
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
