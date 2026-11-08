package co.edu.cun.dado.servlet;

import co.edu.cun.dado.dao.UsuarioDAO;
import co.edu.cun.dado.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/registro"})
public class RegistroServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        if (nombre == null || email == null || password == null || nombre.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Todos los campos obligatorios deben ser completados.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        Usuario nuevo = new Usuario();
        nuevo.setNombre(nombre.trim());
        nuevo.setEmail(email.trim());
        nuevo.setPassword(password.trim());
        nuevo.setTelefono(telefono != null ? telefono.trim() : "");
        nuevo.setDireccion(direccion != null ? direccion.trim() : "");
        nuevo.setRol("cliente");

        boolean exito = usuarioDAO.registrar(nuevo);

        if (exito) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", nuevo);
            session.setAttribute("mensaje", "¡Cuenta creada con éxito! Bienvenido a DADO.");
            response.sendRedirect(request.getContextPath() + "/productos");
        } else {
            request.setAttribute("error", "No se pudo registrar. Es posible que el correo ya esté en uso o haya un problema con la base de datos.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
        }
    }
}
