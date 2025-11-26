package trivy

import rego.v1

# CVEs que REALMENTE existen en tu imagen wp-demo:cve-test
allowed_cves := {
    "CVE-2022-37434"  # zlib - CRITICAL (la única que Trivy encontró)
}

default ignore := false

# Ignora todo lo que NO esté en allowed_cves
ignore if {
    input.VulnerabilityID
    not input.VulnerabilityID in allowed_cves
}
