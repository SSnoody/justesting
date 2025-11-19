# Matriz de Riesgos - CI/CD Pipeline WordPress

| Activo Crítico | Riesgo | Causa | Impacto | Probabilidad | Nivel Riesgo | Valoración | Control Aplicable | Tipo Control |
|---|---|---|---|---|---|---|---|---|
| Imagen Docker | CVE en paquetes del OS | Software desactualizado | 5 | 4 | 20 | Alto | Trivy SAST en CI | Preventivo |
| App WordPress | Inyección SQL / XSS | Input no validado | 5 | 3 | 15 | Alto | Nuclei DAST | Correctivo |
| ECR Repository | Acceso no autorizado | IAM policy débil | 5 | 2 | 10 | Medio | Restricción de IAM | Preventivo |
| Base de datos MariaDB | Exposición de datos | No encriptada | 4 | 3 | 12 | Medio | Encriptación TLS | Correctivo |
| Actualización automática | Despliegue sin testing | Falta de validation | 4 | 2 | 8 | Bajo | Pipeline CI/CD | Preventivo |
| Credenciales en CI | Fuga de secrets | Malas prácticas | 5 | 1 | 5 | Bajo | GitHub Secrets | Preventivo |

## Controles Implementados

### Preventivos (antes del riesgo)
- Trivy SAST: identifica CVEs antes del deployment
- GitHub Secrets: protege credenciales
- IAM Roles: restringe acceso a recursos

### Correctivos (mitigar daño)
- Nuclei DAST: detecta vulnerabilidades en vivo
- Watchtower: actualiza automáticamente con patches
- Reportes de auditoría: registro de hallazgos
