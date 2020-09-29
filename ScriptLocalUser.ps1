function Show-Menu #Cria uma função em linguagem PowerShell, seguida do parametro Nome_da_Funcao
{
           [string]$Title = 'Menu' #Define a variavel Title

           [string]$TitleAdd = 'Configuração de usuario' #Define a variavel Title

           [string]$TitleDel = 'Excluir um usuario local' #Define a variavel Title

           [string]$TitleDomain = 'Adicionar ao Dominio' #Define a variavel Title

           [string]$TitleRename = 'Adicionar ao Dominio' #Define a variavel Title

           [string]$TitleIP6 = 'Verificar e desativar IPV6' #Define a variavel Title

     cls
     Write-Host "================ $Title ================" #Chama a variavel Title
     
     Write-Host "1 - Verificar usuarios locais" #Write-Host funciona como print(python), Echo(bat/Php), escreve uma msg na tela
     Write-Host "2 - Adicionar um usuario local"
     Write-Host "3 - Renomear o computador(Reinicia Logo em Seguida)"
     Write-Host "4 - Adicionar um usuario no dominio(*WinPro)"
     Write-Host "5 - Sair"
}

do
{
     Show-Menu
     $input = Read-Host "Selecione uma opção"
     switch ($input)
     {
           '1' {
                cls
                net user

           } '2' {
                cls
                Write-Host "================ $TitleAdd ================"

                $Usuario = Read-Host "Digite o nome do novo usuario local"
                $Senha = Read-Host "Digite a senha para o usuario"
                $Escolha = Read-Host "O usuario podera trocar a propria senha?(S/N)"
                switch ($Escolha)
                {
                    'S' {
                        net user $Usuario $Senha /passwordchg:yes /add
                  } 'N' {
                        net user $Usuario $Senha /passwordchg:no /add
                  }
                }

           } '3' {
                cls
                Write-Host "================ $TitleRename ================"

                $RenUsuario = Read-Host "Qual o novo nome do computador?"
                Write-Host "O computador será reiniciado logo em seguida"
                Rename-Computer -NewName $RenUsuario -Restart
                 
           } '4' {
                cls
                Write-Host "================ $TitleDomain ================"

                $Dominio = Read-Host "Qual o nome do dominio a ser adicionado"
                $Credencial = Read-Host "Qual o usuario administrator do dominio"
                $EscolhaDomain = Read-Host "Deseja reiniciar depois de adicionar ao dominio?(S/N)"
                pause
                switch ($EscolhaDomain)
                {
                    'S' {
                        Write-Host "Por Favor, digite a senha do dominio a seguir"
                        Add-Computer -DomainName BRAZIL -Credential administrator -Restart
                  } 'N' {
                        Write-Host "Por Favor, digite a senha do dominio a seguir"
                        Add-Computer -DomainName BRAZIL -Credential administrator
                  }
                }

           } '5' {
                return
           }
     }
}
until ($input -eq '5')  

# SIG # Begin signature block
# MIIFeQYJKoZIhvcNAQcCoIIFajCCBWYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUuO4mVRvjO4MZOmac3Oc5laX5
# dCugggMYMIIDFDCCAfygAwIBAgIQG3jq2C6j7alMiRYaPBeU3DANBgkqhkiG9w0B
# AQsFADAWMRQwEgYDVQQDDAtUZXN0U2NyaXB0czAeFw0yMDAzMDUxMjU4NDNaFw0y
# MTAzMDUxMzE4NDNaMBYxFDASBgNVBAMMC1Rlc3RTY3JpcHRzMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnid78i/nGJlMD4KoISOlMpu6JDIj/qihcxgm
# yXQvceQQH7UhL7f9bQM4WtGxSzHy2CVFm7ZcmRw+zYmUYdPNud9XNl5qkI57YIWQ
# 1b7c7i2lr31EXZol4e0BNX9NtGzfY2lTKw8i///+Vi7GLkkiv/yGKaLJj4Zg4J6s
# RzBc5DtIlBdQfbQeg1lpch10aHw7iPqdz+rJuWCH+r5pDQoCni033XfTtT+8Ct9Q
# 694WPZnQ6zylv6kfZsjFpjU3nEOnc9o6DCXED/YRovXnGpGa7TV6c3c6GNYabuD7
# XtGKv+WMlJjpRpcGeYLEbbQrc8MPxDXDBZpTC/jCulWBvmnl7QIDAQABo14wXDAO
# BgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwFgYDVR0RBA8wDYIL
# VGVzdFNjcmlwdHMwHQYDVR0OBBYEFNkROXIEoxLGupiVH6Ca9g6wzUrPMA0GCSqG
# SIb3DQEBCwUAA4IBAQAhACs/vf030OR17Lwv/tucpHwVrE5SPvCqCq4ce6dScmzF
# PEov09wloGv9esmHJB69R5wL++EWIe2oEAI6MdRpcNHqoQJhimDOIOcExduOHCCy
# Ml2/lyD/0dJ+lLx9qg7nw+OX+Vmn7P8/7xSMpFlIv0JQhFuuhKoBHOaQOGBzpa6K
# uRxFsP2b8qGiViiwEAwavjl7nc2uizkM0YJtLFJDULTp/gj8h6c7Z5stoZuAz44B
# fihmF2nxSNodzVV37/uTcuSlmXcEotEV18gcO3tVMiWoxAOGN0ENAz5QZ+/qtNPe
# C2wOZRjqgzLD8mVkqjKpsZZuzgQ7WHGfHfgp7eoaMYIByzCCAccCAQEwKjAWMRQw
# EgYDVQQDDAtUZXN0U2NyaXB0cwIQG3jq2C6j7alMiRYaPBeU3DAJBgUrDgMCGgUA
# oHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYB
# BAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0B
# CQQxFgQUVARKh4b0PeBj1JWgjqAcayz18O0wDQYJKoZIhvcNAQEBBQAEggEAAbLq
# X+ZNY4Ga1V3WMZbgIxPg9DmP141Lyd1/ldpmC/s85xzlpXsxYTMonvrlt/LcOu4i
# BxUGJS9je3NXQWP1BzsaoYHQqqHPAY6NRjcCwLa1CK962nFRrE8t1usj03ryF/xT
# hAQx0kmJwblfS71n+5jgAnokHhZ8RuzTeH/fghhiFaN0ZHzOHQ/ox12T9XqxOaH9
# aAYLVevyHreZUvPSKbrJ6mXbRV9Wk777Ge5VtLu4Za5UYqd1PNPaCGEWS7MBao+N
# 5xg05QrjjoUOmXaL6vYU1lixf2qHfoBGr4TqDIWsZhdn3rs8qehNvNLbn70rsWG/
# 8SiZ4pffQRwOcj7+2A==
# SIG # End signature block
