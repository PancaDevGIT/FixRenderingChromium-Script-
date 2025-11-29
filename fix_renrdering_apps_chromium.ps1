$Texts = @{
    RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\Dwm"
    ValueName = "OverlayMinFPS"
    ValueData = 0
    ValueType = "DWORD"

    ES = @{
        Title = "Script de Corrección de Renderizado de Chromium (OverlayMinFPS)"
        LanguageSelection = "Por favor, selecciona tu idioma (selecciona el número y presiona Enter):"
        Option1 = "1. Español"
        Option2 = "2. Inglés"
        Option3 = "3. Francés"
        InvalidInput = "Entrada no válida. Por favor, selecciona 1, 2 o 3."
        Starting = "Iniciando la corrección de OverlayMinFPS para el Desktop Window Manager (DWM)..."
        RegistryPathMsg = "Ruta del registro:"
        SuccessRegistry = "✅ Clave de registro '$($Texts.ValueName)' creada/modificada con éxito a valor $($Texts.ValueData)."
        ErrorAdmin = "❌ ERROR: No se pudo modificar el registro. Asegúrate de que PowerShell se esté ejecutando como Administrador."
        ErrorMsg = "Mensaje de error:"
        RestartingDWM = "Reiniciando el proceso Desktop Window Manager (DWM)..."
        SuccessDWM = "✅ Servicio de directiva de visualización (DPS) reiniciado. Esto forzará el reinicio del DWM."
        WarningDWM = "⚠️ Advertencia: No se pudo reiniciar el servicio DPS. El cambio surtirá efecto después de reiniciar el equipo o cerrar sesión."
        Completed = "Corregido. El problema de renderizado debería haberse resuelto. Por favor, reinicia tus aplicaciones de Chromium."
    }
    
    EN = @{
        Title = "Chromium Rendering Fix Script (OverlayMinFPS)"
        LanguageSelection = "Please select your language (select the number and press Enter):"
        Option1 = "1. Spanish"
        Option2 = "2. English"
        Option3 = "3. French"
        InvalidInput = "Invalid input. Please select 1, 2, or 3."
        Starting = "Starting OverlayMinFPS fix for the Desktop Window Manager (DWM)..."
        RegistryPathMsg = "Registry Path:"
        SuccessRegistry = "✅ Registry key '$($Texts.ValueName)' successfully created/modified to value $($Texts.ValueData)."
        ErrorAdmin = "❌ ERROR: Could not modify the registry. Ensure PowerShell is running as Administrator."
        ErrorMsg = "Error message:"
        RestartingDWM = "Restarting the Desktop Window Manager (DWM) process..."
        SuccessDWM = "✅ Display Policy Service (DPS) restarted. This will force a DWM restart."
        WarningDWM = "⚠️ Warning: Could not restart the DPS service. The change will take effect after restarting the computer or logging off."
        Completed = "Fix applied. The rendering issue should be resolved. Please restart your Chromium applications."
    }

    FR = @{
        Title = "Script de Correction du Rendu Chromium (OverlayMinFPS)"
        LanguageSelection = "Veuillez sélectionner votre langue (sélectionnez le numéro et appuyez sur Entrée) :"
        Option1 = "1. Espagnol"
        Option2 = "2. Anglais"
        Option3 = "3. Français"
        InvalidInput = "Saisie non valide. Veuillez sélectionner 1, 2 ou 3."
        Starting = "Démarrage de la correction OverlayMinFPS pour le Gestionnaire de Fenêtres du Bureau (DWM)..."
        RegistryPathMsg = "Chemin du Registre :"
        SuccessRegistry = "✅ Clé de registre '$($Texts.ValueName)' créée/modifiée avec succès à la valeur $($Texts.ValueData)."
        ErrorAdmin = "❌ ERREUR: Impossible de modifier le registre. Assurez-vous que PowerShell est exécuté en tant qu'administrateur."
        ErrorMsg = "Message d'erreur :"
        RestartingDWM = "Redémarrage du processus Gestionnaire de Fenêtres du Bureau (DWM)..."
        SuccessDWM = "✅ Service de politique d'affichage (DPS) redémarré. Cela forcera un redémarrage del DWM."
        WarningDWM = "⚠️ Avertissement: Impossible de redémarrer le service DPS. La modification prendra effet après le redémarrage de l'ordinateur o la déconnexion."
        Completed = "Corrigé. Le problème de rendu devrait être résolu. Veuillez redémarrer vos applications Chromium."
    }
}

function Show-LanguageMenu {
    Write-Host "=====================================================" -ForegroundColor Cyan
    Write-Host $($Texts.ES.Title) -ForegroundColor Cyan
    Write-Host "=====================================================" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host $($Texts.ES.LanguageSelection) -ForegroundColor Yellow
    Write-Host $($Texts.ES.Option1) -ForegroundColor White
    Write-Host $($Texts.ES.Option2) -ForegroundColor White
    Write-Host $($Texts.ES.Option3) -ForegroundColor White
    Write-Host ""

    $Selection = Read-Host ">>> "

    switch ($Selection) {
        "1" { return "ES" }
        "2" { return "EN" }
        "3" { return "FR" }
        default {
            Write-Host $($Texts.ES.InvalidInput) -ForegroundColor Red
            return $null
        }
    }
}

$LanguageCode = $null
while ($LanguageCode -eq $null) {
    $LanguageCode = Show-LanguageMenu
}

$L = $Texts.$LanguageCode

Write-Host ""
Write-Host "--- $($L.Title) ---" -ForegroundColor Cyan
Write-Host $($L.Starting) -ForegroundColor Yellow
Write-Host "$($L.RegistryPathMsg) $($Texts.RegistryPath)"

try {
    Set-ItemProperty -Path $Texts.RegistryPath -Name $Texts.ValueName -Value $Texts.ValueData -Type $Texts.ValueType -Force

    Write-Host $($L.SuccessRegistry) -ForegroundColor Green
    
}
catch {
    Write-Host $($L.ErrorAdmin) -ForegroundColor Red
    Write-Host "$($L.ErrorMsg) $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host $($L.RestartingDWM) -ForegroundColor Yellow

try {
    Restart-Service -Name "DPS" -Force
    Write-Host $($L.SuccessDWM) -ForegroundColor Green
}
catch {
    Write-Host $($L.WarningDWM) -ForegroundColor DarkYellow
}

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Green
Write-Host $($L.Completed) -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Green