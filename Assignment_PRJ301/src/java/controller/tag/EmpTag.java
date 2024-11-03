/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.tag;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class EmpTag extends SimpleTagSupport {

    private Date value;

    public void setValue(Date value) {
        this.value = value;
    }

    @Override
    public void doTag() throws JspException, IOException {
        String url = "jdbc:sqlserver://localhost\\TRUONGPHUONGANH:1433;databaseName=Assignment;trustServerCertificate=true;";
        String user = "phuonganh";
        String password = "1234";
        if (value != null) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String formattedDate = formatter.format(value);
            JspWriter out = getJspContext().getOut();
            out.print(formattedDate);
        }
    }
}
