#!/bin/bash
cat << "EOF" 
                                                                                                                                                    
,--.   ,--.       ,--.          ,--.  ,--.             ,--.   ,--.       ,--.                              ,--.   ,--.,--.,--.  ,--.               
|  |   |  | ,---. |  |-.  ,---. `--',-'  '-. ,---.      \  `.'  /,--.,--.|  |,--,--,  ,---. ,--.--. ,--,--.|  |-. `--'|  |`--',-'  '-.,--. ,--.    
|  |.'.|  || .-. :| .-. '(  .-' ,--.'-.  .-'| .-. :      \     / |  ||  ||  ||      \| .-. :|  .--'' ,-.  || .-. ',--.|  |,--.'-.  .-' \  '  /     
|   ,'.   |\   --.| `-' |.-'  `)|  |  |  |  \   --.       \   /  '  ''  '|  ||  ||  |\   --.|  |   \ '-'  || `-' ||  ||  ||  |  |  |    \   '      
'--'   '--' `----' `---' `----' `--'  `--'   `----'        `-'    `----' `--'`--''--' `----'`--'    `--`--' `---' `--'`--'`--'  `--'  .-'  /       
 ,---.                                                                                                                                `---'        
'   .-'  ,---. ,--,--.,--,--, ,--,--,  ,---. ,--.--.                                                                                               
`.  `-. | .--'' ,-.  ||      \|      \| .-. :|  .--'                                                                                               
.-'    |\ `--.\ '-'  ||  ||  ||  ||  |\   --.|  |                                                                                                  
`-----'  `---' `--`--'`--''--'`--''--' `----'`--'ASV                                                                                                  
                                                                                                                                                                                                            
                                                                                      
EOF

main() {
    cd /
    
    while true; do
        echo "Enter a choice: "
        echo "1. XSS Checker"
        echo "2. Cancel"
        read -r choice

        case $choice in
            1)
                read -p "Enter the URL for XSS Checker: " url
                memUsage "$url"
                ;;
            2)
                break
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

memUsage() {
    local url=$1
    echo "$banner"
    echo ">>>>> XSS Checker  <<<<<"
    echo " "
    echo "----------------------"
    echo "XSS Information"
    echo
    echo "XSS Checker: $(python /home/xyz0101/Desktop/XSSToolKit/xss.py "$url")"
    echo "-----------------------"
    echo
    echo " "
    echo " "
}

main "$@"

