# SkillTrack Empresas

Aplicación web desarrollada en **Java / Spring Boot** para gestionar empresas y colaboradores que participan en programas de capacitación tecnológica.  
Forma parte del **portafolio final del Bootcamp Fullstack Java**

La solución incluye:

- Módulo web MVC con **JSP + Bootstrap**.
- Acceso a datos con **Spring Data JPA + MySQL**.
- **API REST** de apoyo para empresas y colaboradores.
- **Script de base de datos completo** (creación de esquema, tablas, datos de ejemplo y consultas avanzadas).
- **Módulo de lógica de reportes** con pruebas unitarias **JUnit 5**.
- **Deploy en Railway** con perfil `railway` (H2 en memoria + datos iniciales).

---

##  Objetivos del proyecto

- Aplicar buenas prácticas de **desarrollo web con Spring MVC**.
- Modelar un dominio simple con **empresas, colaboradores, cursos e inscripciones**.
- Implementar consultas SQL con `JOIN`, `WHERE`, `GROUP BY` y `ORDER BY`.
- Construir una pequeña API **RESTful**.
- Incorporar un mini módulo de **lógica + tests unitarios** para demostrar manejo de bucles, condiciones y pruebas automatizadas.
- Entregar un proyecto listo para ser presentado en un **portafolio profesional**.
- Practicar el **deploy en la nube** (Railway) con perfiles y bases de datos distintos a local.

---

##  Stack tecnológico

- **Lenguaje:** Java (JDK 17+ probado con JDK 21/24)
- **Framework:** Spring Boot 3.x
  - Spring Web (Spring MVC)
  - Spring Data JPA
- **Vista:** JSP, JSTL, Bootstrap 5
- **Base de datos:**
  - **Base de datos:** MySQL 8
  - **H2 en memoria** (perfil `railway` / deploy en Railway)
- **Build:** Maven (con wrapper `mvnw`)
- **Empaquetado:** **WAR ejecutable** (compatibilidad con JSP en producción y Railway)
- **Testing:** JUnit 5
- **Servidor embebido:** Tomcat 10 (embebido en Spring Boot)

---

##  Modelo de dominio

Tablas principales del esquema `skilltrack`:

- `empresa`
  - `id_empresa` (PK)
  - `nombre`
  - `rubro`
  - `ciudad`
  - `email_contacto`

- `colaborador`
  - `id_colaborador` (PK)
  - `nombre`
  - `rut`
  - `email`
  - `cargo`
  - `id_empresa` (FK → `empresa`)

- `curso`
  - `id_curso` (PK)
  - `nombre`
  - `categoria`
  - `nivel`
  - `duracion_horas`

- `inscripcion`
  - `id_inscripcion` (PK)
  - `id_colaborador` (FK → `colaborador`)
  - `id_curso` (FK → `curso`)
  - `fecha_inscripcion`
  - `estado` (ej: `APROBADO`, `EN_CURSO`, `REPROBADO`)

- `evaluacion`
  - `id_evaluacion` (PK)
  - `id_inscripcion` (FK → `inscripcion`)
  - `nota_final`
  - `observaciones`

---

##  Base de datos y scripts

Los scripts de base de datos se encuentran en la carpeta:

```text
docs/bd/
```

### 1. Script principal de BD

Archivo:

```text
docs/bd/script.sql
```

Este script:

1. Crea la base de datos `skilltrack` (si no existe).
2. Crea todas las tablas del modelo (`empresa`, `colaborador`, `curso`, `inscripcion`, `evaluacion`).
3. Inserta **datos de ejemplo** para pruebas locales.

>  Ideal para ejecutar directamente en MySQL Workbench / consola antes de levantar la aplicación.

### 2. Usuario dedicado para la aplicación

Archivo:

```text
docs/bd/usuario_skilltrack.sql
```

Este script crea un usuario dedicado para la aplicación, por ejemplo:

- Usuario: `skilltrack_user`
- Password: `Skilltrack123$` (o la que se configure localmente)

Se recomienda ejecutar este script **después** de `script.sql` y ajustar la contraseña según el entorno.

---
### 3. Consultas SQL de apoyo (JOIN, WHERE, GROUP BY, ORDER BY)

Archivo:


```text
docs/bd/consultas.sql
```

##  Configuración de la aplicación

Por seguridad, el repositorio no incluye el archivo `application.properties` con credenciales reales.  
En su lugar, se entrega un archivo de ejemplo:

```text
src/main/resources/application-example.properties
```

### Pasos para configurar localmente

1. Crear la base de datos y tablas ejecutando:

   - `docs/bd/script.sql`
   - `docs/bd/usuario_skilltrack.sql`

2. Copiar el archivo de ejemplo:

   ```bash
   cp src/main/resources/application-example.properties src/main/resources/application.properties
   ```

3. Editar `src/main/resources/application.properties` y ajustar:

   ```properties
   spring.datasource.username=skilltrack_user
   spring.datasource.password=TU_PASSWORD_AQUI
   ```

4. Verificar que la URL de conexión apunte a tu MySQL local:

   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/skilltrack?useSSL=false&serverTimezone=America/Santiago
   ```

---

##  Ejecución del proyecto

Requisitos previos:

- MySQL 8 instalado y corriendo.
- JDK 17 o superior.
- Maven (puede usarse el wrapper incluido `mvnw`).

### Pasos

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/josecorrea01/skilltrack-empresas.git
   cd skilltrack-empresas
   ```

2. Configurar BD y `application.properties` como se explicó arriba.

3. Levantar la aplicación:

   ```bash
   ./mvnw spring-boot:run
   ```

4. Abrir en el navegador:

   - Página principal:  
      `http://localhost:8080/`

---
##  Ejecución local simulando Railway (perfil `railway` + H2)

Para simular el entorno de Railway en tu máquina:

1. Asegúrate de tener `src/main/resources/application-railway.properties` con la siguiente config base:

   ```properties
   spring.profiles.active=railway

   server.port=${PORT:8080}

   # BD H2 en memoria
   spring.datasource.url=jdbc:h2:mem:skilltrack;MODE=MySQL;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
   spring.datasource.driver-class-name=org.h2.Driver
   spring.datasource.username=sa
   spring.datasource.password=

   # JPA + datos iniciales
   spring.jpa.hibernate.ddl-auto=create
   spring.jpa.defer-datasource-initialization=true
   spring.sql.init.mode=always
   spring.sql.init.data-locations=classpath:data-railway.sql

   # JSP
   spring.mvc.view.prefix=/WEB-INF/views/
   spring.mvc.view.suffix=.jsp
   ```

2. Compilar el proyecto:

   ```bash
   mvn clean package -DskipTests
   ```

3. Ejecutar el WAR con el perfil `railway`:

   ```bash
   java -jar target/skilltrack-empresas-0.0.1-SNAPSHOT.war --spring.profiles.active=railway
   ```

4. Probar en el navegador:

    - `http://localhost:8080/health` → debe responder algo como:  
      `SkillTrack Empresas OK - perfil railway`
    - `http://localhost:8080/`
    - `http://localhost:8080/empresas`
    - `http://localhost:8080/colaboradores`

---

##  Deploy en Railway

El proyecto **Skilltrack-Empresas** está desplegado en Railway usando:

- **Spring Boot 3.3.0**
- **Java 21**
- **JSP + JSTL** como motor de vistas
- **H2 en memoria** para el perfil `railway`
- Empaquetado como **WAR ejecutable**

###  URL de producción

- App en Railway:  
  `https://skilltrack-empresas-production.up.railway.app`
- Endpoint de salud:  
  `https://skilltrack-empresas-production.up.railway.app/health`

###  Configuración en Railway (resumen)

- **Repositorio:** GitHub `josecorrea01/skilltrack-empresas`
- **Build command:**

  ```bash
  mvn -DskipTests package
  ```

- **Start command:**

  ```bash
  java -jar target/skilltrack-empresas-0.0.1-SNAPSHOT.war
  ```

- **Variables de entorno:**

    - `SPRING_PROFILES_ACTIVE=railway`

###  Vistas JSP en modo WAR

Las vistas JSP se encuentran en:

```text
src/main/webapp/WEB-INF/views/
    index.jsp
    empresas/
    colaboradores/
    api/
```

La configuración de vistas (también en `application-railway.properties`):

```properties
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

###  Datos iniciales en Railway (H2)

Script de datos iniciales para H2 (`src/main/resources/data-railway.sql`):

```sql
-- Datos de ejemplo para H2 (perfil railway)

INSERT INTO empresa (nombre, rubro, ciudad, email_contacto) VALUES
    ('TechCorp', 'Desarrollo de Software', 'Santiago',   'rrhh@techcorp.cl'),
    ('DataPlus', 'Análisis de Datos',      'Valparaíso', 'contacto@dataplus.cl');

INSERT INTO colaborador (nombre, rut, email, cargo, id_empresa) VALUES
    ('Ana Pérez',   '11.111.111-1', 'ana.perez@techcorp.cl',   'Backend Trainee', 1),
    ('Luis Soto',   '22.222.222-2', 'luis.soto@techcorp.cl',   'QA',              1),
    ('Carla Díaz',  '33.333.333-3', 'carla.diaz@dataplus.cl',  'Data Trainee',    2);

INSERT INTO curso (nombre, categoria, nivel, duracion_horas) VALUES
    ('Java Backend Inicial', 'Backend', 'Inicial',    40),
    ('Fundamentos de SQL',   'Datos',   'Inicial',    24),
    ('Testing Automatizado', 'QA',      'Intermedio', 32);

INSERT INTO inscripcion (id_colaborador, id_curso, fecha_inscripcion, estado) VALUES
    (1, 1, DATE '2025-01-10', 'APROBADO'),
    (1, 2, DATE '2025-02-01', 'EN_CURSO'),
    (2, 3, DATE '2025-01-15', 'REPROBADO'),
    (3, 2, DATE '2025-01-20', 'APROBADO');

INSERT INTO evaluacion (id_inscripcion, nota_final, observaciones) VALUES
    (1, 6.0, 'Buen desempeño'),
    (3, 3.9, 'Debe reforzar contenidos'),
    (4, 5.5, 'Cumple expectativas');

```

##  Funcionalidades principales (Web MVC)

### 1. Módulo Empresas

Rutas principales (lado servidor):

- `GET /empresas`
  - Lista todas las empresas.
  - Permite búsqueda por texto (`q`) en nombre / rubro.
- `GET /empresas/{id}`
  - Muestra el detalle de una empresa.
- `GET /empresas/nueva`
  - Muestra formulario para crear una nueva empresa.
- `POST /empresas`
  - Procesa el formulario y guarda la empresa en BD.
  - Redirige a `/empresas`.

Vistas JSP relacionadas:

- `WEB-INF/views/empresas/lista.jsp`
- `WEB-INF/views/empresas/detalle.jsp`
- `WEB-INF/views/empresas/form.jsp`

Características:

- Uso de **Bootstrap** para tablas, formularios, botones y navbar.
- Uso de **JSTL** (`<c:forEach>`, `<c:if>`) para recorrer y mostrar datos.

### 2. Módulo Colaboradores

Rutas principales:

- `GET /colaboradores`
  - Lista todos los colaboradores.
- `GET /colaboradores/{id}`
  - Muestra detalle de un colaborador.
- `GET /colaboradores/nuevo`
  - Formulario para crear colaborador, seleccionando empresa asociada.
- `POST /colaboradores`
  - Guarda el nuevo colaborador en BD (incluye `rut`, `email`, `cargo`).
  - Redirige a `/colaboradores`.

Vistas JSP relacionadas:

- `WEB-INF/views/colaboradores/lista.jsp`
- `WEB-INF/views/colaboradores/detalle.jsp`
- `WEB-INF/views/colaboradores/form.jsp`

---

##  Mini módulo de lógica y tests (JUnit)

Además del flujo web y REST, el proyecto incluye un mini módulo de lógica de reportes, para mostrar dominio de:

- Bucles (`for`)
- Condiciones (`if`)
- Cálculos sobre colecciones (porcentaje, promedio, conteos)
- Pruebas unitarias con JUnit

### Lógica

Paquetes:

```text
src/main/java/com/jcorrea/skilltrack_empresas/logic/
```

- `ReporteInscripcionService` (interfaz)
- `ReporteInscripcionServiceImpl` (implementación)

Responsabilidades:

- `calcularPorcentajeAprobados(List<String> estados)`
- `calcularPromedioNotas(List<Double> notas)`
- `contarPorEstado(List<String> estados, String estadoBuscado)`

### Tests JUnit

Archivo de test:

```text
src/test/java/com/jcorrea/skilltrack_empresas/logic/ReporteInscripcionServiceImplTest.java
```

Incluye **varios casos de prueba** que cubren:

- Flujos normales (listas con datos).
- Casos borde (listas vacías, valores nulos, mezclas de mayúsculas/minúsculas).

Ejecutar los tests:

```bash
./mvnw test
```

---

##  API REST de apoyo

La aplicación expone un pequeño API REST para integraciones o pruebas con herramientas como Postman/Insomnia.

### Empresas

- `GET /api/empresas`
  - Retorna listado de empresas en formato JSON.

- `GET /api/empresas/{id}`
  - Retorna una empresa específica por ID (JSON).

### Colaboradores

- `GET /api/colaboradores`
  - Retorna listado completo de colaboradores en formato JSON.
  - Utiliza un `ColaboradorDTO` para exponer:
    - `id`, `nombre`, `email`, `rut`, `cargo`
    - `empresaId`, `empresaNombre`

- `GET /api/colaboradores?empresaId={idEmpresa}`
  - Filtra colaboradores por empresa.

>  Estos endpoints son útiles para demostrar el criterio de **controlador REST con buenas prácticas HTTP/REST**.

---
### Vista de exploración de la API

- `GET /api/explorer`
    - Renderiza una vista JSP con enlaces rápidos a los endpoints REST de empresas y colaboradores.
    - Útil como panel de apoyo para pruebas manuales con navegador o para demostración en presentaciones.


##  Estructura del proyecto (resumen)

```text
skilltrack-empresas/
├─ docs/
│  ├─ bd/
│  │  ├─ script.sql               # Crea BD y tablas + datos de ejemplo
│  │  ├─ usuario_skilltrack.sql   # Crea usuario dedicado de BD
│  │  └─ consultas.sql            # Consultas SQL de apoyo (JOIN, WHERE, GROUP BY, ORDER BY)
│  └─ capturas/                   # Evidencias en formato PNG/JPG (ver sección siguiente)
│
├─ src/
│  ├─ main/
│  │  ├─ java/com/jcorrea/skilltrack_empresas/
│  │  │  ├─ controller/           # Controladores MVC y REST
│  │  │  ├─ dto/                  # DTOs para la capa REST (ej. ColaboradorDTO)
│  │  │  ├─ model/                # Entidades JPA
│  │  │  ├─ repository/           # Repositorios Spring Data JPA
│  │  │  ├─ service/              # Servicios de negocio
│  │  │  └─ logic/                # Lógica de reportes (módulo testeable con JUnit)
│  │  └─ webapp/WEB-INF/views/    # JSP (index, empresas, colaboradores, explorer, etc.)
│  └─ test/
│     └─ java/com/jcorrea/skilltrack_empresas/
│        ├─ SkilltrackEmpresasApplicationTests.java
│        └─ logic/                # Tests JUnit de ReporteInscripcionServiceImpl
│
├─ src/main/resources/
│  ├─ application-example.properties
│  ├─ application-railway.properties
│  └─ data-railway.sql
│
├─ pom.xml
└─ README.md
```

---

## Evidencias de funcionamiento (capturas)

Todas las capturas se encuentran en:

```text
docs/capturas/
```

---

### 1. Aplicación web (MVC)

**1.1. Arranque de la aplicación**

Consola de Spring Boot con el servidor Tomcat levantando correctamente en el puerto `8080`:

![Consola: aplicación levantando en 8080](docs/capturas/01_consola_app_levanta.png)

**1.2. Navegación principal**

Página de inicio del panel SkillTrack Empresas (`http://localhost:8080/`):

![Home / página de inicio](docs/capturas/02_home_index.png)

Listado de empresas asociadas:

![Listado de empresas](docs/capturas/03_empresas_lista.png)

Formulario para crear una nueva empresa:

![Formulario nueva empresa](docs/capturas/04_empresas_form_nueva.png)

Listado de colaboradores registrados:

![Listado de colaboradores](docs/capturas/05_colaboradores_lista.png)

Formulario para crear un nuevo colaborador:

![Formulario nuevo colaborador](docs/capturas/06_colaboradores_form_nuevo.png)

Vista alternativa del listado de empresas en `http://localhost:8080/empresas`:

![Empresas en /empresas](docs/capturas/8080_lista_empresas.png)

---

### 2. API REST y vista de exploración

Pruebas de los endpoints REST con Postman y vista JSP de apoyo:

- `GET /api/empresas` – listado de empresas en formato JSON:

  ![REST empresas](docs/capturas/rest_empresas_postman.png)

- `GET /api/empresas/1` – detalle de empresa por ID:

  ![REST empresa ID 1](docs/capturas/rest_empresas_id1_postman.png)

- `GET /api/colaboradores` – listado de colaboradores (con información de empresa):

  ![REST colaboradores](docs/capturas/rest_colaboradores_postman.png)

- Vista JSP de exploración de la API (`/api/explorer`):

  ![Vista explorer API](docs/capturas/rest_api_explorer_view.png)

---

### 3. Base de datos y consultas SQL

**3.1. Esquema de la base de datos**

Diagrama del esquema `skilltrack` en MySQL Workbench:

![Esquema BD skilltrack](docs/capturas/bd_esquema_skilltrack.png)

**3.2. Consultas SQL de apoyo**  
(Ejecutadas desde el script `docs/bd/consultas.sql`)

1. Inscripciones con colaborador, curso, categoría y estado  
   (`JOIN` de 3 tablas + `ORDER BY`):

   ![Consulta 1: inscripciones con detalle](docs/capturas/bd_consulta_01_inscripciones_detalle.png)

2. `JOIN` de 4 tablas: empresas, colaboradores, inscripciones y evaluaciones  
   (incluye `LEFT JOIN` para nota final):

   ![Consulta 2: JOIN de 4 tablas](docs/capturas/bd_consulta_02_join4tablas.png)

3. Filtro con `WHERE`: colaboradores **aprobados** en cursos **Backend** de una empresa específica:

   ![Consulta 3: WHERE aprobados Backend](docs/capturas/bd_consulta_03_where_aprobados_backend.png)

4. `ORDER BY` por nombre de curso y fecha de inscripción (más recientes al inicio):

   ![Consulta 4: ORDER BY curso y fecha](docs/capturas/bd_consulta_04_orderby_curso_fecha.png)

5. `GROUP BY` + funciones de agregación: **porcentaje de aprobación por curso**:

   ![Consulta 5: porcentaje de aprobación por curso](docs/capturas/bd_consulta_05_groupby_porcentaje_aprobacion.png)

6. `GROUP BY` simple: **cantidad de colaboradores por empresa**:

   ![Consulta 6: colaboradores por empresa](docs/capturas/bd_consulta_06_groupby_colaboradores_por_empresa.png)

7. TOP de cursos por número de inscripciones (ordenados de mayor a menor):

   ![Consulta 7: top cursos por inscripciones](docs/capturas/bd_consulta_07_top_cursos_inscripciones.png)

---

### 4. Pruebas automatizadas y build

Pruebas unitarias y build del proyecto con Maven:

- Pruebas JUnit de `ReporteInscripcionServiceImplTest` pasando en IntelliJ:

  ![Tests JUnit reporte de inscripciones](docs/capturas/test_reporte_inscripcion_intellij.png)

- Ejecución de `mvn clean test` con la base de datos configurada correctamente:

  ![mvn clean test OK](docs/capturas/mvn-clean-test-bd-ok.png)

- Ejecución general de `mvn test` con `BUILD SUCCESS`:

  ![mvn test OK](docs/capturas/mvn_test_ok.png)

---
### Evidencias del deploy en Railway

A continuación se presentan las evidencias del despliegue de la aplicación en Railway.

**1. Dashboard del servicio en Railway**

Muestra el servicio `skilltrack-empresas` en estado `Running` y el último deploy registrado.

![Railway - Dashboard del servicio](docs/capturas/railway_01_dashboard.png)

---

**2. Configuración de Build y Start Command**

Se ve la configuración utilizada por Railway para construir y ejecutar la aplicación:

- Build command: `mvn -DskipTests package`
- Start command: `java -jar target/skilltrack-empresas-0.0.1-SNAPSHOT.war`

![Railway - Build y Start Command](docs/capturas/railway_02_build_start.png)

---

**3. Variables de entorno (SPRING_PROFILES_ACTIVE=railway)**

Evidencia de que la aplicación se ejecuta con el perfil `railway` en producción, usando H2 en memoria y la configuración correspondiente.

![Railway - Variables de entorno](docs/capturas/railway_03_env_vars.png)

---

**4. Logs de arranque con perfil `railway` activo**

Se observan las líneas de log donde:

- Se indica que el perfil activo es `railway`.
- Se inicializa Tomcat en el puerto 8080.
- Se crea la conexión a la base de datos H2 en memoria (`jdbc:h2:mem:skilltrack`).

![Railway - Logs de arranque](docs/capturas/railway_04_logs_arranque.png)

---

**5. Home de la aplicación en producción (`/`)**

Captura de la página de inicio desplegada en Railway:

- URL: `https://skilltrack-empresas-production.up.railway.app/`

![Railway - Home en producción](docs/capturas/railway_05_home.png)

---

**6. Listado de empresas en producción (`/empresas`)**

Listado de empresas cargado desde la base de datos H2 de Railway, utilizando el script de datos iniciales `data-railway.sql`.

- URL: `https://skilltrack-empresas-production.up.railway.app/empresas`

![Railway - Listado de empresas](docs/capturas/railway_06_empresas.png)

---

**7. Endpoint de salud `/health` en producción**

Evidencia del endpoint de salud que confirma que la aplicación está levantada y que se está ejecutando con el perfil correcto.

- URL: `https://skilltrack-empresas-production.up.railway.app/health`

![Railway - Endpoint /health](docs/capturas/railway_07_health.png)


## Video tutorial técnico

- **Título:** Tutorial técnico SkillTrack-Empresas – Java, Spring Boot, JSP, MySQL y deploy en Railway
- **Enlace YouTube (no listado):** https://youtu.be/Q79a4HWbkOw

---
## Estado del proyecto

- **Tipo:** Proyecto educativo / demostrativo (no orientado a producción).
- **Contexto:** Evaluación técnica y portafolio del Bootcamp Fullstack Java (Skillnest / Talento Digital), módulo 7.
- **Entorno probado:**
    - Local: Windows 10, IntelliJ IDEA, MySQL 8, JDK 17+.
    - Nube: Railway (Java 21, Spring Boot 3, H2 en memoria, WAR ejecutable).

##  Mejoras futuras

Algunas ideas de evolución del proyecto:

- Agregar autenticación y roles (ADMIN / USER) con Spring Security.
- Incorporar paginación y ordenamiento en las tablas de empresas y colaboradores.
- Añadir más endpoints REST (crear/actualizar/eliminar) siguiendo buenas prácticas RESTful.
- Mejorar el módulo de reportes para calcular estadísticas directamente desde la BD (consultas JPA/SQL).
- Migrar la base de datos de producción de H2 a MySQL gestionado en la nube.

---

##  Autor

**José Correa Herrera**  
Proyecto desarrollado como parte del Bootcamp Fullstack Java (Skillnest / Talento Digital), módulo 7 de proyecto final y portafolio de productos.
