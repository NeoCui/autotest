#!/bin/sh

vmware -v >8-13.txt

echo "*******************************************************************************************************************************************************************

This test case need enable X2APCI feature in BIOS
**********************************************************************************************************************************************************************"
echo -n "Check?(yes(y)|no(n)): " 
                read need 
                case $need in 
                yes|y) 
                  echo "************************************************************************************************************************************************
Check X2APCI status if the Configured value is TURE need input t or FALSE input f  
Runtime value need reboot
**********************************************************************************************************************************************************************"
                  esxcli system settings kernel list -o iovDisableIR

                  esxcli system settings kernel list -o iovDisableIR >>8-13.txt

                  cat /var/log/vmkernel.log | grep -i ESR >>8-13.txt
                  echo -n "Check?(TURE(t)|FALSE(f):"
                  read need
                  case $need in
                  TURE|t)

                  esxcli system settings kernel set --setting=iovDisableIR -v FALSE  >>8-13.txt
                  ;;
                  FALSE|f)
                  esxcli system settings kernel set --setting=iovDisableIR -v TURE >>8-13.txt
                  ;;
                  esac

                  esxcli system settings kernel list -o iovDisableIR >>8-13.txt


                  cat /var/log/vmkernel.log | grep -i ESR >>8-13.txt
                                               
                      ;; 
                no|n)   
                       exit
                       ;; 
                esac

