import psycopg2
import sys
import csv

sys.path.append('/Library/Python/2.7/site-packages')
import xlrd


def main():
	conn = psycopg2.connect(database="plug_loads", user="sreejitaray", password="postgres", host="127.0.0.1", port="5432")
	print "Opened database successfully"
	cur = conn.cursor()

	all_data = xlrd.open_workbook('plug_loads_data_sheet.xlsx')
	print all_data.nsheets
	print all_data.sheet_names()
	user_sheet = all_data.sheet_by_index(1)
	length_rows_user = user_sheet.nrows

	for i in range(length_rows_user): 
		if i > 0:
			acol = [user_sheet.row_values(i)[j] for j in range(user_sheet.ncols) if user_sheet.row_values(i)[j]]
			print acol
			cur.execute("INSERT INTO sb_dash.users (user_id,password,node_id) VALUES (%s, %s, %s)", (acol[0], acol[1], int(acol[2])));
	conn.commit()
	print "Records created successfully";
	conn.close()

if __name__ == '__main__':
	main()