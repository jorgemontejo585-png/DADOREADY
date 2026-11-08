<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - DADO Streetwear</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body class="module-page">
<div class="module-container" style="max-width:500px;padding-top:60px;">
    <h1 class="module-title">Iniciar sesión</h1>
    <p class="module-subtitle">Ingresa con tus credenciales para gestionar tu cuenta.</p>

    <% if (request.getAttribute("error") != null) { %>
        <div class="message message-error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <div class="form-box">
        <!-- Formulario HTML con metodo POST conectado a LoginServlet -->
        <form action="<%= request.getContextPath() %>/login" method="POST">
            <div class="form-group">
                <label for="email">Correo electrónico</label>
                <input type="email" id="email" name="email" value="admin@boxesya.com" required>
            </div>

            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" value="" required>
            </div>

            <button type="submit" class="module-btn" style="width:100%;">Ingresar</button>
        </form>
        
        <div style="margin-top:20px;text-align:center;font-size:13px;color:var(--text-muted);">
            ¿No tienes una cuenta aún? 
            <a href="<%= request.getContextPath() %>/registro.jsp" style="color:var(--gold-primary);text-decoration:none;font-weight:600;">Regístrate aquí</a>
        </div>
        
        <div style="margin-top:15px;font-size:12px;color:#777;text-align:center;">
     
        </div>
    </div>

    <p style="text-align:center;margin-top:20px;">
        <a href="<%= request.getContextPath() %>/productos" style="color:var(--gold-primary);text-decoration:none;">← Volver al catálogo</a>
    </p>
</div>
</body>
</html>
