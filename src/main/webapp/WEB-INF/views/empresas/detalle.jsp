<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle empresa · SkillTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>

    <!-- Tus estilos -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/skilltrack.css"/>
</head>
<body class="d-flex flex-column min-vh-100">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            SkillTrack Empresas
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSkilltrack" aria-controls="navbarSkilltrack"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSkilltrack">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/">
                        Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/empresas">
                        Empresas
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill py-4">
    <div class="container">
        <div class="mb-3">
            <a href="<c:url value='/empresas' />" class="btn btn-link">
                &laquo; Volver al listado
            </a>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <h1 class="h4 mb-3">Detalle de empresa</h1>

                <dl class="row">
                    <dt class="col-sm-3">ID</dt>
                    <dd class="col-sm-9">${empresa.idEmpresa}</dd>

                    <dt class="col-sm-3">Nombre</dt>
                    <dd class="col-sm-9">${empresa.nombre}</dd>

                    <dt class="col-sm-3">Rubro</dt>
                    <dd class="col-sm-9">${empresa.rubro}</dd>

                    <dt class="col-sm-3">Ciudad</dt>
                    <dd class="col-sm-9">${empresa.ciudad}</dd>

                    <dt class="col-sm-3">Email contacto</dt>
                    <dd class="col-sm-9">${empresa.emailContacto}</dd>
                </dl>

                <!-- Espacio para futuras acciones (editar, ver cursos, etc.) -->
            </div>
        </div>
    </div>
</main>

<footer class="app-footer text-center">
    <div class="container">
        <span>SkillTrack Empresas · M7 Proyecto Portafolio · José Correa</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>