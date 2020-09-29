function Show-Menu #Cria uma função em linguagem PowerShell, seguida do parametro Nome_da_Funcao
{ 
     param ( #Define uma variavel como parametro
           [string]$Title = 'Menu' #Define a variavel Title
     )

     param ( #Define uma variavel como parametro
           [string]$TitleImpressora = 'Instalação da Impressora' #Define a variavel Title
     )

     param ( #Define uma variavel como parametro
           [string]$TitleInstalar = 'Instalando os Drivers' #Define a variavel Title
     )

     cls 
     Write-Host "================ $Title ================" #Chama a variavel Title

     Write-Host "1 - Instalar os drivers da impressora" #Adiciona e instala os drivers necessarios
     Write-Host "2 - Impressora Adm" #Write-Host funciona como print(python), Echo(bat/Php), escreve uma msg na tela
     Write-Host "3 - Impressora Sala/Ponto"
     Write-Host "4 - Impressora Cr"
     Write-Host "5 - Impressora Programa"
     Write-Host "6 - Grants"
     Write-Host "7 - Financeiro" 
     Write-Host "8 - Impressora Sala/Ponto_2"
     Write-Host "9 - Verificar os Drivers"
     Write-Host "10 - ExecutionPolicy Permitida"
     Write-Host "11 - Sair"
}

do 
{ 
     Show-Menu 
     $input = Read-Host "Selecione uma opção" 
     switch ($input) 
     {
          '1' {

                pnputil.exe -i -a D:\Drivers\*.inf
                Add-PrinterDriver -Name "HP Universal Printing PCL 6"

          } '2' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "Adm" -PrinterHostAddress ""
                Add-Printer -Name Adm -DriverName "HP Universal Printing PCL 6" -PortName "Adm"
                Write-Host "Impressora Instalada com sucesso"

          } '3' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title
                
                Add-printerport -Name "Sala/Ponto" -PrinterHostAddress ""
                Add-Printer -Name "Sala/Ponto" -DriverName "HP Universal Printing PCL 6" -PortName "Sala/Ponto"
                Write-Host "Impressora Instalada com sucesso"
          
          } '4' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "CR" -PrinterHostAddress ""
                Add-Printer -Name CR -DriverName "HP Universal Printing PCL 6" -PortName "CR"
                Write-Host "Impressora Instalada com sucesso"
               
          } '5' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "Programas" -PrinterHostAddress ""
                Add-Printer -Name Programas -DriverName "HP Universal Printing PCL 6" -PortName "Programas"
                Write-Host "Impressora Instalada com sucesso"

          } '6' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "Grants" -PrinterHostAddress ""
                Add-Printer -Name Grants -DriverName "HP Universal Printing PCL 6" -PortName "Grants"
                Write-Host "Impressora Instalada com sucesso"
          
          } '7' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "Financeiro" -PrinterHostAddress ""
                Add-Printer -Name CR -DriverName "HP Universal Printing PCL 6" -PortName "Financeiro"
                Write-Host "Impressora Instalada com sucesso"

          } '8' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Add-printerport -Name "Sala/Ponto_2" -PrinterHostAddress ""
                Add-Printer -Name Sala/Ponto_2 -DriverName "HP Universal Printing PCL 6" -PortName "Sala/Ponto_2"
                Write-Host "Impressora Instalada com sucesso"

          } '9' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Get-PrinterDriver


          } '10' {
                cls
                Write-Host "================ $TitleImpressora ================" #Chama a variavel Title

                Set-ExecutionPolicy Restricted
                return "11"
          
          } '11' {
                return
          }
            
        }
    pause
}
until ($input -eq '11')