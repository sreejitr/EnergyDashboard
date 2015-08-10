import psycopg2
import sys
import datetime

sys.path.append('/Library/Python/2.7/site-packages')
import xlrd


def main():
	conn = psycopg2.connect(database="plug_loads", user="sreejitaray", password="postgres", host="127.0.0.1", port="5432")
	print "Opened database successfully"
	cur = conn.cursor()

	all_data = xlrd.open_workbook('plug_loads_data_sheet.xlsx')
	print all_data.nsheets
	print all_data.sheet_names()
	nodes_sheet = all_data.sheet_by_index(8)
	length_rows_nodes = nodes_sheet.nrows

	for i in range(length_rows_nodes): 
		if i > 0:
			acol = [nodes_sheet.row_values(i)[j] for j in range(nodes_sheet.ncols) if nodes_sheet.row_values(i)[j]]
			if acol[3] != " ":
				s = datetime.datetime.strptime(acol[3], "%m/%d/%Y")
			else:
				s = None
			acol[3] = s
			print acol
			cur.execute("INSERT INTO sb_dash.nodes (node_profile_id,mac_addr,bridge_mac_addr,last_updated,user_id) VALUES (%s, %s, %s, %s, %s)", (int(acol[0]), acol[1], acol[2], acol[3], acol[4]));

	conn.commit()
	print "Records created successfully";
	conn.close()

if __name__ == '__main__':
	main()