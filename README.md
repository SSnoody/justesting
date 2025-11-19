# CI/CD Pipeline WordPress con Pentesting en AWS

## Descripción General

Este proyecto implementa un pipeline completo de **Integración Continua y Entrega Continua (CI/CD)** con **análisis de seguridad integrado** (SAST + DAST) para una aplicación WordPress dockerizada en Amazon Web Services.

## Objetivo

Demostrar prácticas profesionales de DevSecOps automatizando:
1. Construcción de imágenes Docker
2. Publicación en Amazon ECR
3. Análisis estático de vulnerabilidades (Trivy)
4. Pentesting dinámico (Nuclei)
5. Despliegue automático sin downtime (Watchtower)

## Arquitectura

### Componentes de Infraestructura

- **AWS EC2**: Instancia Amazon Linux 2023 (t3.small)
- **Amazon ECR**: Registro privado de imágenes Docker
- **GitHub Actions**: Orquestador de CI/CD
- **Self-Hosted Runner**: Ejecutor de workflow en EC2

### Herramientas de Seguridad

- **Trivy**: SAST (Static Application Security Testing) - escanea imagen Docker
- **Nuclei**: DAST (Dynamic Application Security Testing) - pentesting contra app viva
- **Watchtower**: Actualización automática de contenedores

## Pipeline Workflow

### Job 1: Build, Push & Trivy SAST (self-hosted)
Checkout → Docker Build → ECR Login → Push a ECR → Trivy Scan → SARIF Report


### Job 2: Nuclei Pentesting (ubuntu-latest)
Nuclei DAST Scan → JSON Report → Artifacts


### Job 3: Watchtower Update (self-hosted)
Detectar nueva imagen → Pull & Restart → Verificar actualización


## Flujo de Ejecución

1. Desarrollador hace `git push` a rama `main`
2. GitHub Actions dispara workflow automáticamente
3. Self-hosted runner en EC2 construye imagen
4. Imagen se publica en ECR con tag `latest`
5. Trivy escanea vulnerabilidades (SAST)
6. Nuclei ejecuta pentesting contra app viva (DAST)
7. Watchtower detecta nueva imagen y reinicia contenedor
8. WordPress sigue accesible sin downtime

## Hallazgos de Seguridad

### Trivy Container Scan
- Identifica CVEs en capas del OS
- Detecta paquetes desactualizados
- Genera reporte SARIF para auditoría

### Nuclei DAST
- Detecta vulnerabilidades OWASP
- Pruebas de inyección SQL
- Análisis de configuración de servidores
- Detección de tecnologías expuestas

## Instalación y Configuración

### Requisitos
- AWS Account con EC2 disponible
- GitHub Account con repositorio
- Docker & Docker Compose
- AWS CLI configurado

### Pasos

1. Crear instancia EC2 (Amazon Linux 2023)
2. Instalar Docker & Docker Compose
3. Crear repositorio ECR (wp-demo)
4. Crear self-hosted runner en GitHub
5. Configurar secrets (SITE_URL)
6. Push a rama main

## Resultados y Evidencias

- Imagen Docker en ECR con versionamiento
- Reportes SARIF de Trivy en GitHub Security
- Reportes JSON de Nuclei como artifacts
- WordPress accesible en IP pública
- Actualizaciones sin downtime

## Valor Educativo

Demuestra competencias en:
- DevOps y CI/CD pipelines
- Seguridad ofensiva (pentesting)
- Infraestructura en la nube (AWS)
- Automatización y scripting
- Prácticas de producción
