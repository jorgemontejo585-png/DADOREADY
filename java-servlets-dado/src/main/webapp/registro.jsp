<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Cuenta - DADO Streetwear</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>
<body class="module-page">
<div class="dado-root module-page">

    <!-- Navegacion -->
    <nav class="nav">
        <div class="logo">
            <span class="logo-cube">D</span>
            <span class="logo-text">DADO</span>
        </div>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/index.jsp">Inicio</a></li>
            <li><a href="<%= request.getContextPath() %>/productos">Productos</a></li>
        </ul>
        <div class="nav-actions">
            <a href="<%= request.getContextPath() %>/login.jsp" class="nav-btn" style="text-decoration:none;color:#111;">Iniciar sesión</a>
        </div>
    </nav>

    <div class="module-container" style="max-width:540px;padding-top:40px;">
        <h1 class="module-title" style="text-align:center;">Crear Cuenta</h1>
        <p class="module-subtitle" style="text-align:center;">Regístrate para realizar compras, guardar tu dirección y hacer seguimiento a tus pedidos.</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="message message-error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <div class="form-box" style="margin: 0 auto;">
            <form action="<%= request.getContextPath() %>/registro" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre Completo *</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ej: Camilo Andrés Pérez" required>
                </div>

                <div class="form-group">
                    <label for="email">Correo Electrónico *</label>
                    <input type="email" id="email" name="email" placeholder="ejemplo@correo.com" required>
                </div>

                <div class="form-group">
                    <label for="password">Contraseña *</label>
                    <input type="password" id="password" name="password" placeholder="Mínimo 6 caracteres" required>
                </div>

                <div class="form-group">
                    <label for="telefono">Teléfono / WhatsApp (Opcional)</label>
                    <input type="tel" id="telefono" name="telefono" placeholder="Ej: 3101234567">
                </div>

                <div class="form-group">
                    <label for="direccion">Dirección de Entrega (Opcional)</label>
                    <input type="text" id="direccion" name="direccion" placeholder="Ej: Calle 45 #12-34, Bogotá">
                </div>

                <button type="submit" class="module-btn" style="width:100%;margin-top:10px;">Crear mi cuenta</button>
            </form>

            <div style="margin-top:20px;text-align:center;font-size:13px;color:var(--text-muted);">
                ¿Ya tienes una cuenta? 
                <a href="<%= request.getContextPath() %>/login.jsp" style="color:var(--gold-primary);text-decoration:none;font-weight:600;">Inicia sesión aquí</a>
            </div>
        </div>

        <p style="text-align:center;margin-top:24px;">
            <a href="<%= request.getContextPath() %>/productos" style="color:var(--text-dim);text-decoration:none;font-size:13px;">← Volver al catálogo</a>
        </p>
    </div>

    <footer class="footer">
        DADO Streetwear &copy; 2026 - Todos los derechos reservados. Colombia.
    </footer>
</div>
</body>
</html>
