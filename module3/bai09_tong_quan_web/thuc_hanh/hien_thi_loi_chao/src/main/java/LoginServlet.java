import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String userName=request.getParameter("userName");
        String passWork=request.getParameter("passWord");
        PrintWriter writer=response.getWriter();
        writer.println("<html>");
        if ("admin".equals(userName)&& "admin".equals(passWork)){
            writer.println("<h1> welcom " + userName+ " to website</h1>" );
        }else {
            writer.println("<h1> Login erro</h1>");
        }
        writer.println("</html> ");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
