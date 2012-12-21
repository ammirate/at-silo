package atsilo.application.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

import atsilo.application.ControlGestioneBando;
import atsilo.exception.BandoException;

/**
 * Servlet implementation class ServletCaricaBando
 */
@WebServlet("/ServletBandoCarica")
public class ServletBandoCarica extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = Logger.getLogger("global");
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBandoCarica() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    try{
	        
	    
	 // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            
            String filepath="";
             for (FileItem item : items) {
                if (item.isFormField()) {
                    //Non esistono
                    ;
                } else {
                    // Process form file field (input type="file").
                    String fieldname = item.getFieldName();
                    String filename = item.getName();
                    if(filename!=null && !filename.equals(""))
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
                    else
                    {
                        //Nessun file caricato
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/caricamento_bando.jsp?successo=failed&errore=Devi inserire almeno un file"); 
                    }
                }
             }
             
             ControlGestioneBando.getIstance().modificaPath(filepath);
	 }
	
	catch (FileUploadException e)
	{
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/caricamento_bando.jsp?successo=failed&errore=Errore di caricamento del file"); 
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
	} catch (BandoException e) {
        // TODO Blocco di catch autogenerato
        LOG.log(Level.SEVERE, "Bando non modificato", e);
        response.setHeader("Location", "prototipo/caricamento_bando.jsp?successo=failed&errore=Errore di modifica del bando"); 
    }
	    
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/caricamento_bando.jsp?successo=y"); 
   }
}
