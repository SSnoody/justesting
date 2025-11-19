# Guía de Deployment

## Verificación de Stack

En EC2, verifica contenedores corriendo:

docker ps

Debería ver 3 contenedores:
- wordpress (80:80)
- mariadb
- watchtower

Verifica marca de build:

docker exec wordpress-ci_wordpress_1 cat /build-info.txt

## Acceso a Aplicación

URL: http://TU_IP_PUBLICA
Usuarios: snoody / tu_contraseña

## Verificación de Seguridad

### Trivy Report
- GitHub Actions -> Artifacts -> trivy-report
- Contiene SARIF format para analysis

### Nuclei Report
- GitHub Actions -> Artifacts -> nuclei-report
- JSON format con hallazgos DAST

## Actualización de Imagen

Para disparar nuevo build:

En tu repo local:

echo "# Update" >> README.md
git add README.md
git commit -m "Trigger rebuild"
git push origin main

GitHub Actions ejecutará automáticamente
Watchtower reiniciará WordPress con nueva imagen

## Troubleshooting

### Workflow no ejecuta
- Verifica que el runner esté Online en GitHub
- Revisa logs en GitHub Actions

### Nuclei falla
- Verifica que SITE_URL secret esté configurado
- Comprueba que IP pública es accesible desde internet

### Watchtower no actualiza
SSH a EC2 y verifica:

docker logs watchtower

Fuerza actualización manual:

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --run-once wordpress-ci_wordpress_1

