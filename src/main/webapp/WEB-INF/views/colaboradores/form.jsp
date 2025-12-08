<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo colaborador · SkillTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
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
                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/colaboradores">
                        Colaboradores
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill py-4">
    <div class="container mt-4">

        <h1 class="h3 mb-3">Nuevo colaborador</h1>

        <form action="${pageContext.request.contextPath}/colaboradores"
              method="post" class="row g-3">

            <div class="col-md-6">
                <label for="nombre" class="form-label">Nombre completo</label>
                <input type="text" id="nombre" name="nombre" class="form-control"
                       value="${colaborador.nombre}" required>
            </div>

            <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control"
                       value="${colaborador.email}" required>
            </div>

            <div class="col-md-6">
                <label for="rut" class="form-label">RUT</label>
                <input type="text" id="rut" name="rut" class="form-control"
                       value="${colaborador.rut}" required>
            </div>

            <div class="col-md-6">
                <label for="cargo" class="form-label">Cargo</label>
                <input type="text" id="cargo" name="cargo" class="form-control"
                       value="${colaborador.cargo}" required>
            </div>

            <div class="col-md-6">
                <label for="empresaId" class="form-label">Empresa</label>
                <select id="empresaId" name="empresaId" class="form-select" required>
                    <option value="">-- Selecciona una empresa --</option>
                    <c:forEach var="empresa" items="${empresas}">
                        <option value="${empresa.idEmpresa}">
                                ${empresa.nombre} (${empresa.ciudad})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-12 mt-3">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <a href="${pageContext.request.contextPath}/colaboradores"
                   class="btn btn-secondary">
                    Cancelar
                </a>
            </div>
        </form>

    </div>
</main>

<footer class="app-footer text-center">
    <div class="container">
        <span>SkillTrack Empresas · M7 Proyecto Portafolio · José Correa</span>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>