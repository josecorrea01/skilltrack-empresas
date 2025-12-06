<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>API Explorer · SkillTrack Empresas</title>
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
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/colaboradores">
                        Colaboradores
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/api/explorer">
                        API Explorer
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="flex-fill py-4">
    <div class="container mt-4">

        <h1 class="h3 mb-3">API Explorer · Empresas &amp; Colaboradores</h1>
        <p class="text-muted">
            Esta vista permite probar la API REST del sistema sin necesidad de Postman.
            Los datos se obtienen en formato JSON desde
            <code>/api/empresas</code> y <code>/api/colaboradores</code>.
        </p>

        <!-- Empieza fila de tarjetas -->
        <div class="row g-4">

            <!-- Card Empresas -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white">
                        Empresas (GET /api/empresas)
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="buscarEmpresas" class="form-label">
                                Texto de búsqueda (parámetro opcional <code>q</code>)
                            </label>
                            <input type="text" id="buscarEmpresas" class="form-control"
                                   placeholder="Ej: tecnología, consultora, skill…">
                        </div>
                        <div class="d-flex gap-2 mb-3">
                            <button id="btnEmpresas" class="btn btn-primary btn-sm">
                                Probar /api/empresas
                            </button>
                            <button id="btnEmpresasClear" class="btn btn-outline-secondary btn-sm">
                                Limpiar tabla
                            </button>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-sm table-striped align-middle mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Rubro</th>
                                    <th>Ciudad</th>
                                    <th>Email</th>
                                </tr>
                                </thead>
                                <tbody id="tablaEmpresasBody">
                                <tr class="text-muted">
                                    <td colspan="5">Sin datos aún. Haz clic en "Probar /api/empresas".</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card Colaboradores -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-success text-white">
                        Colaboradores (GET /api/colaboradores)
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="empresaIdFiltro" class="form-label">
                                Filtro por empresa (parámetro opcional <code>empresaId</code>)
                            </label>
                            <input type="number" id="empresaIdFiltro" class="form-control"
                                   placeholder="Ej: 1, 2, 3…">
                        </div>
                        <div class="d-flex gap-2 mb-3">
                            <button id="btnColabs" class="btn btn-success btn-sm">
                                Probar /api/colaboradores
                            </button>
                            <button id="btnColabsClear" class="btn btn-outline-secondary btn-sm">
                                Limpiar tabla
                            </button>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-sm table-striped align-middle mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>RUT</th>
                                    <th>Cargo</th>
                                    <th>Email</th>
                                    <th>Empresa</th>
                                </tr>
                                </thead>
                                <tbody id="tablaColabsBody">
                                <tr class="text-muted">
                                    <td colspan="6">Sin datos aún. Haz clic en "Probar /api/colaboradores".</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- JSON crudo -->
        <div class="mt-4">
            <h2 class="h5">Respuesta JSON cruda</h2>
            <p class="text-muted">
                Última respuesta recibida desde la API (útil para depurar).
            </p>
            <pre id="jsonOutput" class="bg-light p-3 border rounded small"
                 style="max-height: 320px; overflow: auto;">
// Aquí aparecerá el JSON de la última llamada a la API...
            </pre>
        </div>

    </div>
</main>

<footer class="app-footer text-center">
    <div class="container">
        <span>SkillTrack Empresas · M7 Proyecto Portafolio · José Correa</span>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Context path para que funcione si no está desplegado en raíz
    const contextPath = '${pageContext.request.contextPath}';

    document.addEventListener('DOMContentLoaded', () => {
        const btnEmpresas = document.getElementById('btnEmpresas');
        const btnEmpresasClear = document.getElementById('btnEmpresasClear');
        const buscarEmpresas = document.getElementById('buscarEmpresas');
        const tablaEmpresasBody = document.getElementById('tablaEmpresasBody');

        const btnColabs = document.getElementById('btnColabs');
        const btnColabsClear = document.getElementById('btnColabsClear');
        const empresaIdFiltro = document.getElementById('empresaIdFiltro');
        const tablaColabsBody = document.getElementById('tablaColabsBody');

        const jsonOutput = document.getElementById('jsonOutput');

        btnEmpresas.addEventListener('click', async () => {
            let url = contextPath + '/api/empresas';
            const q = buscarEmpresas.value.trim();
            if (q !== '') {
                url += '?q=' + encodeURIComponent(q);
            }
            await fetchAndRender(url, 'empresas', tablaEmpresasBody, jsonOutput);
        });

        btnEmpresasClear.addEventListener('click', () => {
            tablaEmpresasBody.innerHTML =
                '<tr class="text-muted"><td colspan="5">Sin datos. Haz clic en "Probar /api/empresas".</td></tr>';
        });

        btnColabs.addEventListener('click', async () => {
            let url = contextPath + '/api/colaboradores';
            const empresaId = empresaIdFiltro.value.trim();
            if (empresaId !== '') {
                url += '?empresaId=' + encodeURIComponent(empresaId);
            }
            await fetchAndRender(url, 'colaboradores', tablaColabsBody, jsonOutput);
        });

        btnColabsClear.addEventListener('click', () => {
            tablaColabsBody.innerHTML =
                '<tr class="text-muted"><td colspan="6">Sin datos. Haz clic en "Probar /api/colaboradores".</td></tr>';
        });
    });

    async function fetchAndRender(url, tipo, tableBody, jsonOutput) {
        try {
            const response = await fetch(url);
            const data = await response.json();

            // Mostrar JSON bonito
            jsonOutput.textContent = JSON.stringify(data, null, 2);

            // Renderizar tabla según tipo
            if (!Array.isArray(data) || data.length === 0) {
                tableBody.innerHTML =
                    '<tr class="text-muted"><td colspan="' + (tipo === 'empresas' ? '5' : '6') + '">Sin resultados.</td></tr>';
                return;
            }

            if (tipo === 'empresas') {
                renderEmpresasTable(data, tableBody);
            } else if (tipo === 'colaboradores') {
                renderColabsTable(data, tableBody);
            }
        } catch (e) {
            console.error('Error al llamar a la API', e);
            jsonOutput.textContent = 'Error al llamar a la API: ' + e;
            tableBody.innerHTML =
                '<tr class="text-danger"><td colspan="' + (tipo === 'empresas' ? '5' : '6') + '">Error al obtener datos.</td></tr>';
        }
    }
    function renderEmpresasTable(empresas, tableBody) {
        let html = '';
        empresas.forEach(function(e, index) {
            html += '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + (e.nombre || '') + '</td>' +
                '<td>' + (e.rubro || '') + '</td>' +
                '<td>' + (e.ciudad || '') + '</td>' +
                '<td>' + (e.emailContacto || '') + '</td>' +
                '</tr>';
        });
        tableBody.innerHTML = html;
    }

    function renderColabsTable(colabs, tableBody) {
        let html = '';
        colabs.forEach(function(c, index) {
            html += '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + (c.nombre || '') + '</td>' +
                '<td>' + (c.rut || '') + '</td>' +
                '<td>' + (c.cargo || '') + '</td>' +
                '<td>' + (c.email || '') + '</td>' +
                '<td>' +
                (c.empresaNombre || '') +
                (c.empresaId ? ' (ID ' + c.empresaId + ')' : '') +
                '</td>' +
                '</tr>';
        });
        tableBody.innerHTML = html;
    }
</script>

</body>
</html>