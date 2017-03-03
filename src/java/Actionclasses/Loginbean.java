/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actionclasses;

/**
 *
 * @author INSPIRON15
 */
public class Loginbean {
    String name,password;
    public String getName(){return name;}
    public void setName(String name){this.name=name;}
    
       public String getPassword(){return password;}
    public void setPassword(String password){this.password=password;}
    
    public boolean validate()
    { if(password.equals("set ur own password for login(or at the time of login u want to check)")){return true;}
    else return false;
    }
}
