<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle colaborador · SkillTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>

    <!-- Estilos propios -->
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
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/empresas">
                        Empresas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="${pageContext.request.contextPath}/colaboradores">
                        Colaboradores
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill py-4">
    <div class="container">
        <h1 class="h3 mb-3 mt-2">Detalle de colaborador</h1>

        <div class="card shadow-sm">
            <div class="card-body">
                <dl class="row mb-0">
                    <dt class="col-sm-3">ID</dt>
                    <dd class="col-sm-9">${colaborador.idColaborador}</dd>

                    <dt class="col-sm-3">Nombre</dt>
                    <dd class="col-sm-9">
                        ${colaborador.nombre}
                    </dd>

                    <dt class="col-sm-3">Email</dt>
                    <dd class="col-sm-9">${colaborador.email}</dd>

                    <dt class="col-sm-3">Empresa</dt>
                    <dd class="col-sm-9">
                        <c:if test="${not empty colaborador.empresa}">
                            ${colaborador.empresa.nombre}
                        </c:if>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="mt-3">
            <a class="btn btn-secondary"
               href="${pageContext.request.contextPath}/colaboradores">
                Volver al listado
            </a>
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