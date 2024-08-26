#!/bin/sh

db_dir=`ls /home/tibero/tibero6/database | grep tibero`

generate_tip() {

	pstack_dir=`ls /home/tibero/tibero6/config | grep tibero`

	if [ ! "$pstack_dir" ] ; then
		echo "generating tibero tip..."
		/home/tibero/tibero6/config/gen_tip.sh
		mkdir -p /usr/bin/pstack
	else
		echo "already exist tibero tip..."
	fi

}

init_database(){

	echo "initialize tibero database..."

	#generate_tip

	/home/tibero/tibero6/bin/tbboot nomount
	tbsql sys/tibero @'/home/tibero/init.sql'
}


generate_tip


if [ ! "$db_dir" ] ; then
	init_database
fi


echo "starting tibero database..."

/home/tibero/tibero6/bin/tbboot
/home/tibero/tibero6/scripts/system.sh -p1 tibero -p2 syscat -a1 y -a2 y -a3 y -a4 y -sod y


echo "started tibero database..."

tail -f /dev/null