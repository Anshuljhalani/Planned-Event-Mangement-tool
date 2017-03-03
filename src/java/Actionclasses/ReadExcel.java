/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actionclasses;

import Actionclasses.Uploadbean;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
//import static java.rmi.Naming.list;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import java.util.Random;
import java.lang.Math;

//import java.util.ArrayList;
//import static java.util.Collections.list;
//import java.util.Iterator;
//import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.ss.usermodel.Cell;
import static org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 *
 * @Anshul
 */
public class ReadExcel { 
    public  String filelocation;
    public ReadExcel(String filePath) {
       filelocation=filePath;
        try{
            FileInputStream file=new  FileInputStream(new File(filelocation));
            //new workbook is created
                XSSFWorkbook workbook=new XSSFWorkbook(file);
                //new sheet is created
                XSSFSheet sheet=workbook.getSheetAt(0);
                /*rowIterator - Returns an iterator of the physical rows
                   iterator - Alias for rowIterator() to allow foreach loops
                So basically they return the same values, but the second was added 
                to support Java's for-each loop. In other words, instead of getting the iterator
                and running while loop, you could directly run for-each loop, which makes code 
                shorter and more readable
                             */
                //Creating random table
               Insert();
               //loop for iterate in each row
               for(Row row:sheet){  
                   //List list=new ArrayList();
                   //loop for iterate in each cell in a particular row
                   for(Cell cell:row){ 
                       cell.setCellType(CELL_TYPE_STRING);
                       switch(cell.getCellType())
                               {
                           case Cell.CELL_TYPE_BOOLEAN:
                               System.out.println("boolean===>>>\"+cell.getBooleanCellValue() + \"\\t");
                               break;
                           case Cell.CELL_TYPE_NUMERIC:  
                               break;
                           case Cell.CELL_TYPE_STRING:
                               //list.add(cell.getStringCellValue());
                               System.out.println(cell.getStringCellValue());
                               break;
                       }
                   }
                   String Name=row.getCell(0).getStringCellValue();
                   String Emailid=row.getCell(1).getStringCellValue();
                   System.out.println(Name+" "+Emailid);
                   Insertindb(Name,Emailid);
               } 
               //file.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
                Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
            }
}
    public static void Insert()
    {   try{
        Class.forName("com.mysql.jdbc.Driver");
            //register the driver and get Connection
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ur database name","root","ur database password"); 
         Random rand = new Random ();
         int n = rand.nextInt ();  // generate random number
        n= Math.abs(n);         // take absolute value
        String tblName = "tmp_tbl_" + n;     
        Uploadbean u=new Uploadbean();
        u.settableName(tblName);
        String sql="Create table "+tblName+"(name varchar(27),emailid varchar(50))";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.executeUpdate();
    }
    catch (SQLException ex) {
                Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
            }
            catch (ClassNotFoundException ex) {
            Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
    public static void Insertindb(String Name,String Emailid)
    {   
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            //register the driver and get Connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ur database name","root","ur database password"); 
        Uploadbean u=new Uploadbean();
        String tblName;
        tblName=u.gettableName();
        String sql2="Insert into "+tblName+"(name,emailid) values(?,?)";
        PreparedStatement ps1=con.prepareStatement(sql2);
         ps1.setString(1, Name);
         ps1.setString(2, Emailid);
         ps1.executeUpdate();
         System.out.println("Values Inserted Successfully");
         con.close();
        }  catch (SQLException ex) {
                Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
            }
            catch (ClassNotFoundException ex) {
            Logger.getLogger(ReadExcel.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }
}
