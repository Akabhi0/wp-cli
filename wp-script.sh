function Sql_function(){
   echo "function is calling sql";
}

#***********************************Service of  Nginx*************************************#
#*****************************************************************************************#

function Start_nginx(){
echo "status==>`sudo service nginx status`"\n ##this is command to check the status of nginx
echo "1>Start 2>Stop 3>Restart"\n
read nginx3

  case $nginx3 in
  1)
   sudo service nginx start
  ;;
  2)
   sudo service nginx stop
  ;;
  3)
    sudo service nginx restart
  ;;
  esac
echo "status==> `sudo service nginx status` "
# sudo service nginx start
# sudo service nginx stop
# sudo service nginx restart
}
echo "#************************INSTALLATION OF LAMP STACK**************************************#"
echo "#****************************************************************************************#"
echo "press 1>NGINX 2>MYSQL-server 3>PHP"
read prosses;
echo "#****************************************************************************************#"
echo "#****************************************************************************************#"
echo

case $prosses in 
1)
war=`dpkg -s nginx | grep Status`
if [[ "$war" == *Status* ]]
then 
   echo $war 
   echo "Starting Nginx Server 1>YES 2>NO"
   read nginx2
       if [ $nginx2 -eq 1 ]
       then
           Start_nginx; 
       fi  
else
   echo  "Your IP `ifconfig | perl -nle'/dr:(\S+)/ && print$1'` \n"
   echo  "Press 1>nginx installation" 
   read nginx

   if [ $nginx -eq 1 ]
   then
    #****************************Installing nginx********************#
    #****************************************************************#
    echo  "Your IP `ifconfig | perl -nle'/dr:(\S+)/ && print$1'` \n"
    #sudo sudo apt-get update
    sudo apt-get install nginx
    sudo ufw app list
    sudo ufw enable
    sudo ufw allow 'Nginx HTTP'
    sudo ufw allow 'OpenSSH'
    sudo ufw status
    echo "nginx installation is completed! \n"
    Start_nginx;

    #*****************************************************************#
    #*****************************************************************#
   else
     echo "Invalid Input!"
   fi
fi
;;
    #*********************Installing Sql-server**********************#
    #****************************************************************#  
2)
  war2 = `dpkg -s mysql-server | grep Status`

  if [ $war == *Status* ]
  then
   echo "install"
  else
    echo "press 1>Install Mysql-server"
    read sql1

    if [ $sql1 -eq 1 ]
    then
      echo "write"
    else
      echo "you are doing on sence"
    fi
fi    
;;
    #************************Installing php**************************#
    #****************************************************************#    
3)
  echo "php installation"
;;
esac


