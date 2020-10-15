list:
	mysql -u root --password=secret --protocol=tcp -t mysql -e 'select * from person;'

set3: clean
	docker run -d -p 3306:3306 -v $$PWD/sql/set3:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=secret mysql
set5: clean
	docker run -d -p 3306:3306 -v $$PWD/sql/set5:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=secret mysql

wait:
	bash -c "while ! mysql -u root --password=secret --protocol=tcp mysql -e 'select 1' >/dev/null 2>&1 ; do echo -n . ; sleep 1; done"

clean:
	docker rm -f $(shell docker ps -qa) 2>/dev/null || true