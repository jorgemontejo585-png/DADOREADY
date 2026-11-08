<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="co.edu.cun.dado.model.Producto" %>
<%@ page import="co.edu.cun.dado.model.Usuario" %>
<%@ page import="co.edu.cun.dado.dao.ProductoDAO" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioLogueado");
    ProductoDAO pdao = new ProductoDAO();
    List<Producto> productos = pdao.listarActivos();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DADO - Streetwear Colombia</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>
<body>
<div class="dado-root">

    <!-- 1. BARRA DE NAVEGACION -->
    <nav class="nav">
        <div class="logo">
            <span class="logo-cube">D</span>
            <span class="logo-text">DADO</span>
        </div>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/index.jsp" style="font-weight:bold;">Inicio</a></li>
            <li><a href="<%= request.getContextPath() %>/productos">Productos</a></li>
        </ul>
        <div class="nav-actions">
            <a href="<%= request.getContextPath() %>/carrito" class="cart-icon" title="Carrito">
                <i class="ti ti-shopping-cart"></i>
            </a>
            <% if (usuarioLogueado != null) { %>
                <span style="font-size:13px;color:#333;">Hola, <%= usuarioLogueado.getNombre() %></span>
                <% if ("admin".equalsIgnoreCase(usuarioLogueado.getRol())) { %>
                    <a href="<%= request.getContextPath() %>/admin/productos" class="nav-btn" style="text-decoration:none;color:#111;">Admin</a>
                <% } %>
                <a href="<%= request.getContextPath() %>/logout" class="nav-btn" style="text-decoration:none;color:#111;">Salir</a>
            <% } else { %>
                <a href="<%= request.getContextPath() %>/login.jsp" class="nav-btn" style="text-decoration:none;color:#111;">Iniciar sesión</a>
            <% } %>
        </div>
    </nav>

    <!-- 2. SECCION HERO -->
    <section class="hero">
        <div class="hero-left">
            <div class="hero-tag">NUEVA COLECCIÓN 2026</div>
            <h1 class="hero-title">Ropa Streetwear que nadie más tiene en Colombia</h1>
            <p class="hero-sub">
                Hoodies oversize, chaquetas térmicas y accesorios urbanos exclusivos.
                Envíos contra entrega a todo el país.
            </p>
            <div class="hero-btns">
                <a href="<%= request.getContextPath() %>/productos" class="btn-primary" style="text-decoration:none;">Explorar tienda</a>
                <a href="<%= request.getContextPath() %>/productos" class="btn-ghost" style="text-decoration:none;">Ver novedades →</a>
            </div>
        </div>

        <div class="hero-visual">
            <div class="hero-card tall">
                <div class="hero-card-img"><i class="ti ti-shirt"></i></div>
                <span class="badge-new">NUEVO</span>
                <div class="hero-card-name">Camiseta Oversize Negra</div>
                <div class="hero-card-price">$69.900 COP</div>
            </div>
            <div class="hero-card">
                <div class="hero-card-img"><i class="ti ti-jacket"></i></div>
                <span class="badge-new">TENDENCIA</span>
                <div class="hero-card-name">Chaqueta Bomber Verde</div>
                <div class="hero-card-price">$199.900 COP</div>
            </div>
            <div class="hero-card">
                <div class="hero-card-img"><i class="ti ti-tag"></i></div>
                <span class="badge-new">DROP</span>
                <div class="hero-card-name">Gorra Snapback Coral</div>
                <div class="hero-card-price">$59.900 COP</div>
            </div>
        </div>
    </section>

    <!-- 3. TRUST BAR -->
    <div class="trust-bar">
        <div class="trust-item"><i class="ti ti-truck"></i> Envío contra entrega a todo Colombia</div>
        <div class="trust-item"><i class="ti ti-shield-check"></i> Garantía directa de fábrica</div>
        <div class="trust-item"><i class="ti ti-brand-whatsapp"></i> Atención personalizada</div>
    </div>

    <!-- 4. CATEGORIAS DESTACADAS -->
    <section class="section">
        <div class="section-header">
            <h2 class="section-title">Comprar por categoría</h2>
            <a href="<%= request.getContextPath() %>/productos" class="section-link" style="text-decoration:none;">Ver catálogo completo →</a>
        </div>
        <div class="cats">
            <a href="<%= request.getContextPath() %>/productos?categoria=1" class="cat-card" style="text-decoration:none;">
                <div class="cat-icon"><i class="ti ti-shirt"></i></div>
                <div class="cat-name">Camisetas</div>
                <div class="cat-count">Corte urbano oversize</div>
            </a>
            <a href="<%= request.getContextPath() %>/productos?categoria=2" class="cat-card" style="text-decoration:none;">
                <div class="cat-icon"><i class="ti ti-jacket"></i></div>
                <div class="cat-name">Chaquetas</div>
                <div class="cat-count">Bombers & térmicas</div>
            </a>
            <a href="<%= request.getContextPath() %>/productos?categoria=3" class="cat-card" style="text-decoration:none;">
                <div class="cat-icon"><i class="ti ti-hanger"></i></div>
                <div class="cat-name">Pantalones</div>
                <div class="cat-count">Cargos y joggers</div>
            </a>
            <a href="<%= request.getContextPath() %>/productos?categoria=4" class="cat-card" style="text-decoration:none;">
                <div class="cat-icon"><i class="ti ti-tag"></i></div>
                <div class="cat-name">Accesorios</div>
                <div class="cat-count">Gorras y complementos</div>
            </a>
        </div>
    </section>

    <!-- 5. PIE DE PAGINA -->
    <footer class="footer">
        DADO Streetwear &copy; 2026 - Todos los derechos reservados. Colombia.
    </footer>
</div>
</body>
</html>
