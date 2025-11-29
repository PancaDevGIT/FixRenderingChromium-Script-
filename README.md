# 💻 Fix-Chromium-OverlayMinFPS

Un script de PowerShell diseñado para corregir problemas comunes de renderizado, parpadeo o artefactos visuales en aplicaciones basadas en Chromium (como Google Chrome, Microsoft Edge, Discord, Spotify, etc.) en sistemas Windows, especialmente después de ciertas actualizaciones.

Este problema suele estar relacionado con la forma en que el **Desktop Window Manager (DWM)** gestiona los *overlays* de hardware.

---

## 🇪🇸 Español: Solución de Renderizado Chromium

### ❓ ¿Qué hace el script?

Este script aplica una solución popular encontrada en comunidades de usuarios (como Reddit) que corrige los artefactos visuales sin necesidad de deshabilitar completamente la aceleración por hardware.

El script realiza lo siguiente:

1.  Añade o modifica la clave de registro `OverlayMinFPS` en la ruta `HKLM:\SOFTWARE\Microsoft\Windows\Dwm`, estableciendo su valor a `0` (DWORD).
2.  Fuerza el reinicio del servicio **Display Policy Service (DPS)**, lo que a su vez reinicia el **Desktop Window Manager (DWM)** para que el cambio surta efecto inmediatamente.
3.  Presenta un menú interactivo para seleccionar el idioma (Español, Inglés, Francés).

### 🚀 Instrucciones de Uso

1.  **Guarda el archivo:** Guarda el código del script como `Fix-Chromium-OverlayFPS-MultiLang.ps1`.
2.  **Ejecuta como Administrador:** Haz clic derecho en el archivo `.ps1` y selecciona **"Ejecutar con PowerShell"**. Es **obligatorio** ejecutarlo con permisos de Administrador para modificar el registro.
3.  **Selecciona Idioma:** Sigue las indicaciones del menú para seleccionar tu idioma.
4.  **Finaliza:** Una vez que el script finalice, **cierra y reinicia** completamente todas las aplicaciones basadas en Chromium que presentaban el problema.

---

## 🇬🇧 English: Chromium Rendering Fix Solution

### ❓ What does the script do?

This PowerShell script implements a popular fix found in user communities (like Reddit) that resolves visual artifacts and flickering without fully disabling hardware acceleration.

The script performs the following actions:

1.  Adds or modifies the registry key `OverlayMinFPS` in the path `HKLM:\SOFTWARE\Microsoft\Windows\Dwm`, setting its value to `0` (DWORD).
2.  Forces a restart of the **Display Policy Service (DPS)**, which in turn restarts the **Desktop Window Manager (DWM)**, making the change effective immediately.
3.  Presents an interactive menu to select the language (Spanish, English, French).

### 🚀 Usage Instructions

1.  **Save the File:** Save the script code as `Fix-Chromium-OverlayFPS-MultiLang.ps1`.
2.  **Run as Administrator:** Right-click on the `.ps1` file and select **"Run with PowerShell"**. Running as Administrator is **mandatory** to modify the Windows Registry.
3.  **Select Language:** Follow the menu prompts to choose your preferred language.
4.  **Finish:** Once the script completes, **fully close and restart** all Chromium-based applications that were experiencing the issue.

---

## 🇫🇷 Français : Solution de Correction de Rendu Chromium

### ❓ Que fait le script ?

Ce script PowerShell met en œuvre une solution populaire trouvée dans les communautés d'utilisateurs (comme Reddit) qui résout les artefacts visuels et le scintillement sans avoir à désactiver complètement l'accélération matérielle.

Le script effectue les actions suivantes :

1.  Ajoute ou modifie la clé de registre `OverlayMinFPS` dans le chemin `HKLM:\SOFTWARE\Microsoft\Windows\Dwm`, en définissant sa valeur sur `0` (DWORD).
2.  Force un redémarrage du service **Display Policy Service (DPS)**, ce qui redémarre le **Desktop Window Manager (DWM)** pour que la modification prenne effet immédiatement.
3.  Présente un menu interactif pour sélectionner la langue (Espagnol, Anglais, Français).

### 🚀 Instructions d'utilisation

1.  **Enregistrer le fichier :** Enregistrez le code du script sous le nom `Fix-Chromium-OverlayFPS-MultiLang.ps1`.
2.  **Exécuter en tant qu'administrateur :** Faites un clic droit sur le fichier `.ps1` et sélectionnez **"Exécuter avec PowerShell"**. L'exécution en tant qu'administrateur est **obligatoire** pour modifier le Registre Windows.
3.  **Sélectionner la langue :** Suivez les instructions du menu pour choisir votre langue préférée.
4.  **Terminer :** Une fois le script terminé, **fermez complètement et redémarrez** toutes les applications basées sur Chromium qui rencontraient le problème.
