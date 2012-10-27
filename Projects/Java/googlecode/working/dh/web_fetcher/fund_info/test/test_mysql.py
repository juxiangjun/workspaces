import MySQLdb

class MySQLAdapter:

	def __init__(self):
		self.host = '127.0.0.1' 
		self.user = 'root' 
		self.password = 'root'
		self.db_name = 'mysql'
	
	def run():
		sql = 'select * from users'
		conn=MySQLdb.connect(host=self.host,user=self.user,passwd=self.password,db=self.db_name)
		cursor = conn.cursor()
		cursor.execute(sql)
		result = cursor.fetchall()
		print result

if __name__ == '__main__':
		adapter = MySQLAdapter()
		adapter.run()

