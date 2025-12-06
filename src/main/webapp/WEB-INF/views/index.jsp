<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicio · SkillTrack Empresas</title>
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
                    <a class="nav-link active" aria-current="page"
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
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/colaboradores">
                        Colaboradores
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill">
    <!-- Hero principal -->
    <section class="py-5 bg-light border-bottom">
        <div class="container">
            <div class="row align-items-center">
                <!-- Texto -->
                <div class="col-lg-7">
                    <h1 class="display-5 fw-bold mb-3">Panel Empresas · SkillTrack</h1>
                    <p class="lead mb-4">
                        Plataforma interna para gestionar empresas, colaboradores,
                        cursos, inscripciones y evaluaciones del programa de capacitación.
                    </p>
                    <div class="d-flex gap-2">
                        <a class="btn btn-primary btn-lg btn-main-action"
                           href="${pageContext.request.contextPath}/empresas">
                            Ver empresas
                        </a>
                        <a class="btn btn-outline-secondary btn-lg"
                           href="#">
                            Ver cursos (próximamente)
                        </a>
                    </div>
                </div>

                <!-- Tarjeta resumen -->
                <div class="col-lg-5 mt-4 mt-lg-0">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h2 class="h5 mb-3">Resumen del sistema</h2>
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <strong>${totalEmpresas}</strong> empresas asociadas al programa.
                                </li>
                                <li>
                                    <strong>${totalColaboradores}</strong> colaboradores inscritos en cursos.
                                </li>
                                <li>
                                    Inscripciones y evaluaciones finales (módulos siguientes).
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Texto de “roadmap” -->
    <section class="py-4">
        <div class="container">
            <h2 class="h4 mb-3">Próximos pasos</h2>
            <p class="mb-0">
                Desde este panel se habilitarán vistas para listar empresas,
                cursos, inscripciones y evaluaciones, según los requerimientos
                de la evaluación del módulo.
            </p>
        </div>
    </section>
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