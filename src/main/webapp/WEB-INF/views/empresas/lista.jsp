<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Empresas · SkillTrack</title>
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
                    <a class="nav-link active" aria-current="page"
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
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1 class="h3 mb-0">Empresas</h1>
            <!-- Botón para futuro -->
            <button class="btn btn-primary btn-main-action" type="button" disabled>
                Nueva empresa (próximamente)
            </button>
        </div>

        <c:choose>
            <c:when test="${empty empresas}">
                <div class="alert alert-info">
                    No hay empresas registradas en el sistema.
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Rubro</th>
                            <th>Ciudad</th>
                            <th>Email contacto</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="empresa" items="${empresas}">
                            <tr>
                                <td>${empresa.idEmpresa}</td>
                                <td>
                                    <a href="<c:url value='/empresas/${empresa.idEmpresa}' />">
                                            ${empresa.nombre}
                                    </a>
                                </td>
                                <td>${empresa.rubro}</td>
                                <td>${empresa.ciudad}</td>
                                <td>${empresa.emailContacto}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
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