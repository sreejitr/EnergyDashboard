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
	channel_plug_loads_sheet = all_data.sheet_by_index(11)
	length_rows_channel_plug_loads = channel_plug_loads_sheet.nrows

	for i in range(length_rows_channel_plug_loads): 
		if i > 0:
			acol = [channel_plug_loads_sheet.row_values(i)[j] for j in range(channel_plug_loads_sheet.ncols) if channel_plug_loads_sheet.row_values(i)[j]]
			acol[4] = datetime.datetime.strptime(acol[4], "%m/%d/%Y %H:%M:%S %p")
			print acol
			cur.execute("INSERT INTO sb_dash.channel_plug_loads (node_id,channel_id,power,status,time_stamp,voltage,current,frequency,power_factor,sample_interval) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (acol[0], acol[1], acol[2], acol[3], acol[4], acol[5], acol[6], acol[7], acol[8], acol[9]));

	conn.commit()
	print "Records created successfully";
	conn.close()

if __name__ == '__main__':
	main()