<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Empresas · SkillTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS (CDN) -->
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
                    <a class="nav-link active" aria-current="page"
                       href="${pageContext.request.contextPath}/empresas">
                        Empresas
                    </a>
                </li>
                <!-- Más opciones después (colaboradores, cursos, etc.) -->
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill py-4">
    <div class="container">
        <!-- Título + botón (placeholder) -->
        <div class="d-flex justify-content-between align-items-center mb-3 mt-2">
            <h1 class="h3 mb-0">Empresas asociadas</h1>
            <button class="btn btn-secondary btn-sm" disabled>
                Nueva empresa (próximamente)
            </button>
        </div>

        <!-- Buscador + total -->
        <div class="row mb-3">
            <div class="col-md-8">
                <form class="row g-2" method="get"
                      action="${pageContext.request.contextPath}/empresas">
                    <div class="col-sm-8 col-md-9">
                        <input type="text"
                               class="form-control"
                               name="q"
                               placeholder="Buscar por nombre o rubro..."
                               value="${consulta != null ? consulta : ''}">
                    </div>
                    <div class="col-sm-4 col-md-3 d-grid d-sm-flex">
                        <button type="submit" class="btn btn-primary me-sm-2 mb-2 mb-sm-0">
                            Buscar
                        </button>
                        <a class="btn btn-outline-secondary"
                           href="${pageContext.request.contextPath}/empresas">
                            Limpiar
                        </a>
                    </div>
                </form>
            </div>

            <div class="col-md-4 text-md-end mt-2 mt-md-0">
                <span class="text-muted">
                    Total: ${totalEmpresas} empresa
                    <c:if test="${totalEmpresas != 1}">s</c:if>
                </span>
            </div>
        </div>

        <!-- Listado -->
        <c:choose>
            <c:when test="${empty empresas}">
                <div class="alert alert-info">
                    <c:choose>
                        <c:when test="${not empty consulta}">
                            No se encontraron empresas para
                            "<strong>${consulta}</strong>".
                        </c:when>
                        <c:otherwise>
                            No hay empresas registradas en el sistema.
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Rubro</th>
                            <th scope="col">Ciudad</th>
                            <th scope="col">Email contacto</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="empresa" items="${empresas}" varStatus="st">
                            <tr>
                                <th scope="row">${st.index + 1}</th>
                                <td>${empresa.nombre}</td>
                                <td>${empresa.rubro}</td>
                                <td>${empresa.ciudad}</td>
                                <td>${empresa.emailContacto}</td>
                                <td class="text-center">
                                    <a class="btn btn-sm btn-outline-primary"
                                       href="${pageContext.request.contextPath}/empresas/${empresa.idEmpresa}">
                                        Ver detalle
                                    </a>
                                </td>
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

<!-- Bootstrap JS (bundle con Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>