package atsilo.application.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import atsilo.application.*;
import atsilo.entity.Classe;
import atsilo.entity.Evento;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletEventoModifica")
public class ServletEventoModifica extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlEvento crt;
    private ControlClassi crtClass;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEventoModifica() {
        crt = crt.getIstance();
        crtClass = crtClass.getIstance();
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.println("");
        pw.println("");
        pw.println("");
        pw.println("<h1>Control Login</h1><br>This servlet should not be accessed this way.");
        pw.println("");
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id="";
        Evento oldEvn;
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String filepath="";
        String descrizione="";
        String dataIntera="";
        String nome="";
        String tipo="";
        String cC="";
        String tipologia =""; 
        String username ="";
        ArrayList<String> elencoClassi=new ArrayList<String>();
        try {
         // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items;
            items = upload.parseRequest(request);
           
 
            
            int numClassi=0;
             for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldname = item.getFieldName();
                    if(fieldname.equals("desc"))
                        descrizione=item.getString();
                    else if(fieldname.equals("data"))
                        dataIntera=item.getString();
                    else if(fieldname.equals("oldevento"))
                        id=item.getString();
                    else if(fieldname.equals("nome"))
                        nome=item.getString();
                    else if(fieldname.equals("tipo"))
                        tipo=item.getString();
                    else if(fieldname.equals("cc"))
                        cC=item.getString();
                    else if(fieldname.equals("tipologia"))
                        tipologia=item.getString();
                    else if(fieldname.equals("user"))
                        username=item.getString();
                    else if(fieldname.equals("classe"))
                    {
                        //checkbox
                        elencoClassi.add(item.getString());
                        numClassi++;
                    }
                } else {
                    // Process form file field (input type="file").
                    String fieldname = item.getFieldName();
                    String filename = item.getName();
                    if(filename!=null)
                    {
                        InputStream filecontent = item.getInputStream();
                        String filedir = "atsiloupload";
                        File dir = new File(getServletContext().getRealPath(".")+File.separator+filedir);
                        if(!dir.exists())
                        {
                            dir.mkdir();
                        }
                        File f = new File(getServletContext().getRealPath(".")+File.separator+filedir+File.separator+filename);
                        if(f.exists())
                        {
                            f.delete();
                        }
                        filepath=getServletContext().getRealPath(".")+File.separator+filedir+File.separator+filename;
                        System.out.println(filepath);
                        filepath=filepath.substring(filepath.indexOf(filedir));
                        FileOutputStream fos = new FileOutputStream(f);
                        int b;
                        b=filecontent.read();
                        while(b!=-1)
                        {
                            fos.write(b);
                            b=filecontent.read();
                        }
                        fos.close();
                    }
                }
             }
            oldEvn = crt.getEventoPerId(Integer.parseInt(id));
            if(filepath.equals(""))
            {
                filepath=oldEvn.getPath();
            }
            String YYYYMMDD[];
            YYYYMMDD = dataIntera.split("/");
            Date data = new Date(Integer.parseInt(YYYYMMDD[2])-1900, Integer.parseInt(YYYYMMDD[1])-1, Integer.parseInt(YYYYMMDD[0]));
            Evento nuovoEvn = new Evento(descrizione, nome, cC, data, tipo, oldEvn.getOrganizzatore(), filepath);
            nuovoEvn.setId(Integer.parseInt(id));
            List<Classe> classi = new ArrayList<Classe>();
            if(elencoClassi!=null)
            {
                for(int k=0; k<elencoClassi.size();k++){
                    classi.add(crtClass.getClasseById(Integer.parseInt(elencoClassi.get(k))));
                }
                nuovoEvn.setClassi(classi);
            }
            if(crt.modificaEvento(oldEvn, nuovoEvn) == true){
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/lista_evento.jsp?"+"successo=y&year="+(nuovoEvn.getData().getYear()+1900)+"&month="+(nuovoEvn.getData().getMonth())+"&day="+nuovoEvn.getData().getDate());     
                 
            }
            else{
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/errore.html"); 
            }
        } catch (NumberFormatException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (SQLException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (DBConnectionException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (ClasseException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (FileUploadException e) {
            // TODO Blocco di catch autogenerato
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        }
    }
}
