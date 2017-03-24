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

#**********************************************************************************************#
#**********************************************************************************************#


war=`dpkg -s nginx | grep Status`

if [[ "$war" == *Status* ]]
then 
   echo $war \n
   echo "Starting Nginx Server 1>YES 2>NO"
   read nginx2

       if [ $nginx2 -eq 1 ]
       then
           Start_nginx;
       else
          echo you are in Sql-mode! 
       fi
  
   echo "Checking MYSQL_SERVER 1>YES 2>NO ?:"
   read  sql1
        if [ $sql1 -eq 1 ]
        then 
           echo "starting sql installation"
           Sql_function
        else
           echo done
         fi 
   
else
   echo  "Your IP `ifconfig | perl -nle'/dr:(\S+)/ && print$1'` \n"
   echo  "Installation  press 1>NGINX 2>MYSQL 3>PHP ? \c" 
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
   
    elif [ $nginx -eq 2 ]
    then
    #**************************Installation MYSQL*********************#
    #*****************************************************************#
   
    

   else
     echo "Checking for SQL-SERVER"
     #sql=`dpkg -s `
   fi
fi


