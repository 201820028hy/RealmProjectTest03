//
//  ViewController.swift
//  RealmProjectTest03
//
//  Created by dit03 on 2019. 5. 30..
//  Copyright © 2019년 201820028. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    var personArray: Results<Person>?//객체의 배열. person은 타입
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let realm = try!Realm()
        personArray = realm.objects(Person.self)
    }

    @IBAction func btnAdd(_ sender: Any) {
        //객체 생성
        let  newPerson = Person()
        newPerson.name = txtName.text!
        newPerson.age = Int(txtAge.text!)!
        
        //DB에 객체 저장
        let realm = try!Realm()
        
        try! realm.write {
            realm.add(newPerson)
        }
        
        
        //Add하고 빈 칸으로 만든다.
        txtName.text = ""
        txtAge.text = ""
    }
    
    @IBAction func btnGet(_ sender: Any) {
        let realm = try!Realm()
        
        //personArray와 DB동기화
        personArray = realm.objects(Person.self)
        print(personArray!)
        print(personArray?.count)
    }
    @IBAction func btnDelete(_ sender: Any) {
        let realm = try!Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}

