/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package produto.controle;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author leoomoreira
 */
public class UploadProdutoFotoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = -1;
        FileItem foto = null;
        boolean sucesso = false;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setRepository(new File("/home/leoomoreira/Upload/temp"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
                Iterator<FileItem> iter = items.iterator();
                
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    if (!item.isFormField() && item.getFieldName().equals("foto")) {
                        foto = item;
                    }
                    
                    if (item.isFormField() && item.getFieldName().equals("id")) {
                        id = Integer.parseInt(item.getString());
                    }
                }
                if (id != -1 && foto != null) {
                    foto.write(new File("/home/leoomoreira/Upload/" + id + foto.getName().substring(foto.getName().lastIndexOf("."))));
                    sucesso = true;
                }
            } catch (Exception ex) {
                sucesso = false;
            }
        }
        if (sucesso) {
            request.setAttribute("mensagem", "Upload da foto deste produto foi efetuado com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível processar o upload da foto deste produto");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin.jsp");
        dispatcher.forward(request, response);
    }

}