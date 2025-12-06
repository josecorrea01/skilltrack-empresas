<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nueva Empresa - SkillTrack</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h1>Crear nueva empresa</h1>

    <form action="${pageContext.request.contextPath}/empresas" method="post" class="row g-3">

        <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control"
                   value="${empresa.nombre}" required>
        </div>

        <div class="col-md-6">
            <label for="rubro" class="form-label">Rubro</label>
            <input type="text" id="rubro" name="rubro" class="form-control"
                   value="${empresa.rubro}" required>
        </div>

        <div class="col-md-6">
            <label for="ciudad" class="form-label">Ciudad</label>
            <input type="text" id="ciudad" name="ciudad" class="form-control"
                   value="${empresa.ciudad}" required>
        </div>

        <div class="col-md-6">
            <label for="emailContacto" class="form-label">Email de contacto</label>
            <input type="email" id="emailContacto" name="emailContacto" class="form-control"
                   value="${empresa.emailContacto}" required>
        </div>

        <div class="col-12 mt-3">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/empresas" class="btn btn-secondary">
                Cancelar
            </a>
        </div>
    </form>
</div>

</body>
</html>