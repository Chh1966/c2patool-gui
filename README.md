# c2patool-gui
C2PA Tool GUI Graphical user interface tested with c2patool-v0.26.67.  This is an unofficial GUI wrapper for c2patool-v0.26.67. It is not an official Adobe, CAI, C2PA, or contentauth project.  „built for c2patool 0.26.67“, „tested with c2patool 0.26.67“, „compatible with c2patool 0.26.67“.


# TekNerds C2PA

Lokales Tool zum **Signieren und Prüfen von C2PA Content Credentials** für Dateien aus dem Video-Workflow (z. B. DaVinci Resolve). Die Oberfläche läuft als kleine, lokale Web-App im Browser; die eigentliche Signatur erledigt **c2patool** der Content Authenticity Initiative.

> GUI-Idee: **TekNerds** – Nils Voss & Christian Homburg · Basis-Software: **c2patool (C2PA)**

---

## Was es kann

- **Signieren** – Datei ablegen, Metadaten angeben (Urheber, Software, Aktion, KI-Einsatz, optional Copyright/URL und eigenes Zertifikat) und C2PA-  Credentials einbetten.
- **Prüfen** – eine Datei einlesen und Urheber, Software, KI-Status, Bearbeitungsverlauf, Aussteller und Validierung anzeigen.
- **Anleitung** – komplette Installations- und Nutzungshilfe direkt in der App, inkl. Schaubild der Oberfläche, Problemlösungen und Rechtehinweisen.
- Reine **lokale Verarbeitung** – kein Upload, keine externen Abhängigkeiten (nur die Python-Standardbibliothek + c2patool).

## Voraussetzungen

- macOS
- Python 3 (bei Bedarf: `xcode-select --install`)
- **c2patool** (universal-apple-darwin) – siehe Installation


## Nutzung

Beim Start öffnet sich der Browser auf `http://127.0.0.1:8731`.

### Signieren
Datei ablegen, Felder ausfüllen (Urheber/Copyright sind nur Beispiele), **Signieren**. Die signierte Datei liegt in **`~/Documents/C2PA-signed`**.

### Prüfen
Datei ablegen – die App zeigt die enthaltenen Content Credentials.

### Beenden
Power-Knopf (⏻) oben rechts.

## Hinweise

- **MP4 statt MOV** – c2patool unterstützt `.mov` nur eingeschränkt.
- Ohne eigenes Zertifikat wird ein **Test-Zertifikat** verwendet. 
Die Meldung `signingCredential.untrusted` ist dann **normal** (der Aussteller steht nicht auf der C2PA-Vertrauensliste); 
die Signatur selbst ist gültig.
- `assertion.dataHash.mismatch` bedeutet dagegen, dass die Datei **nach** dem Signieren verändert wurde.
- **Aktionen:** *Erstellt* = Originaldatei · *Bearbeitet* = aus vorhandenem Material verändert.
- DaVinci Resolve hat keine native C2PA-Funktion; der Ablauf ist „exportieren, dann signieren".

## Konfiguration

| Variable | Bedeutung | Standard |
|---|---|---|
| `C2PA_PORT` | Port des lokalen Servers | `8731` |
| `C2PA_OUTPUT_DIR` | Ablageordner für signierte Dateien | `~/Documents/C2PA-signed` |

## Projektaufbau

```
c2pa_signer.py        # die App (lokaler Server + Oberfläche)
make_builder.py       # erzeugt den All-in-One-Builder
tekNerds_build.py     # All-in-One-Builder (App + Icon + Lizenzen eingebettet)
TN_AppIcon.png        # App-Icon
c2pa_licenses/        # LICENSE-APACHE, LICENSE-MIT, Hinweise-Rechte-c2patool.txt
```

Der Builder bettet App, Icon und die Lizenzdateien ein und legt beim Bauen einen Ordner **„Lizenzen"** ins DMG sowie nach `Contents/Resources/Licenses` in der App.

## Lizenzen & Credits

- **c2patool / c2pa-rs** – © Adobe, doppelt lizenziert unter **Apache-2.0 ODER MIT**. Quelle: <https://github.com/contentauth/c2pa-rs>. Wird unverändert mitgeliefert; die vollständigen Lizenztexte liegen in `c2pa_licenses/` bzw. im gebauten DMG/der App.
- **C2PA / Content Credentials** – offener Standard der Coalition for Content Provenance and Authenticity. <https://c2pa.org>
- **Oberfläche „TekNerds C2PA"** – GUI-Idee TekNerds (Nils Voss & Christian Homburg); steht getrennt von c2patool.

> Hinweis: Für den eigenen Quellcode (die GUI) noch eine Lizenz festlegen und hier ergänzen – z. B. MIT. c2patool bleibt davon unberührt.
