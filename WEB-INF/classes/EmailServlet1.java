

import java.io.*;
import java.util.*;
import java.text.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response)
throws IOException, ServletException {

final String err = "/errorpage.jsp";
final String succ = "/Login.html";


HttpSession sess=request.getSession(false);
String mail1=(String) sess.getAttribute("m");
//ResultSet rsemp=(ResultSet)sess.getAttribute("");
String mail2=(String) sess.getAttribute("u");
String mail3=(String) sess.getAttribute("p");

String from = "ogs@gmail.com";
String to =mail1;
String subject = "OGS Account Related Information";
String message = "YOUR ACCOUNT HAS BEEN CREATED."+"\n"+"YOUR USERNAME IS :"+" "+mail2+"\n"+"YOUR PASSWORD IS :"+" "+mail3+" ";
String login = "projectmanagement1417@gmail.com"; 
String password = "project1417";

try {
Properties props = new Properties();
props.setProperty("mail.host", "smtp.gmail.com");
props.setProperty("mail.smtp.port", "587");
props.setProperty("mail.smtp.auth", "true");
props.setProperty("mail.smtp.starttls.enable", "true");

Authenticator auth = new SMTPAuthenticator(login, password);

Session session = Session.getInstance(props, auth);

MimeMessage msg = new MimeMessage(session);
msg.setText(message);
msg.setSubject(subject);
msg.setFrom(new InternetAddress(from));
msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
Transport.send(msg);

} catch (AuthenticationFailedException ex) {
request.setAttribute("ErrorMessage", "Authentication failed");

RequestDispatcher dispatcher = request.getRequestDispatcher(err);
dispatcher.forward(request, response);

} catch (AddressException ex) {
request.setAttribute("ErrorMessage", "Wrong email address");

RequestDispatcher dispatcher = request.getRequestDispatcher(err);
dispatcher.forward(request, response);

} catch (MessagingException ex) {
request.setAttribute("ErrorMessage", ex.getMessage());

RequestDispatcher dispatcher = request.getRequestDispatcher(err);
dispatcher.forward(request, response);
}
RequestDispatcher dispatcher = request.getRequestDispatcher(succ);
dispatcher.forward(request, response);

}
	private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

       
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pr=response.getWriter();
		processRequest(request, response);
		
		response.sendRedirect("Login.html");
	}

}
