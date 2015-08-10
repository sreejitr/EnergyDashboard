import psycopg2
import sys
import csv

sys.path.append('/Library/Python/2.7/site-packages')
import xlrd


def main():
	conn = psycopg2.connect(database="plug_loads", user="sreejitaray", password="postgres", host="127.0.0.1", port="5432")
	print "Opened database successfully"
	cur = conn.cursor()

	all_data = xlrd.open_workbook('Enmetric_NASA_SB_ProvisioningTableInterface.xls')
	channel_sheet = all_data.sheet_by_index(1)
	length_rows_channel = channel_sheet.nrows
	
	print length_rows_channel
	count = 0
	for i in range(length_rows_channel): 
		if i > 0:
			acol = [channel_sheet.row_values(i)[j] for j in range(channel_sheet.ncols)]
			print acol
			#channel profile
			desc = 'Node ' + str(acol[0]) + ' Channel 1'
			print desc, acol[2], acol[1], acol[3]
			cur.execute("INSERT INTO sb_dash.channel_profiles (description,device,user_id,additional_info) VALUES (%s, %s, %s, %s)", (desc, acol[2], acol[1], acol[3]));
			desc = 'Node ' + str(acol[0]) + ' Channel 2'
			print desc, acol[4], acol[1], acol[5]
			cur.execute("INSERT INTO sb_dash.channel_profiles (description,device,user_id,additional_info) VALUES (%s, %s, %s, %s)", (desc, acol[4], acol[1], acol[5]));
			desc = 'Node ' + str(acol[0]) + ' Channel 3'
			print desc, acol[6], acol[1], acol[7]
			cur.execute("INSERT INTO sb_dash.channel_profiles (description,device,user_id,additional_info) VALUES (%s, %s, %s, %s)", (desc, acol[6], acol[1], acol[7]));
			desc = 'Node ' + str(acol[0]) + ' Channel 4'
			print desc, acol[8], acol[1], acol[9]
			cur.execute("INSERT INTO sb_dash.channel_profiles (description,device,user_id,additional_info) VALUES (%s, %s, %s, %s)", (desc, acol[8], acol[1], acol[9]));

			#channel
			count += 1
			print count, 1, acol[0]
			cur.execute("INSERT INTO sb_dash.channels (channel_profile_id,channel_id,node_id) VALUES (%s, %s, %s)", (count, 1, acol[0]));
			count += 1 
			print count, 2, acol[0]
			cur.execute("INSERT INTO sb_dash.channels (channel_profile_id,channel_id,node_id) VALUES (%s, %s, %s)", (count, 2, acol[0]));
			count += 1 
			print count, 3, acol[0]
			cur.execute("INSERT INTO sb_dash.channels (channel_profile_id,channel_id,node_id) VALUES (%s, %s, %s)", (count, 3, acol[0]));
			count += 1 
			print count, 4, acol[0]
			cur.execute("INSERT INTO sb_dash.channels (channel_profile_id,channel_id,node_id) VALUES (%s, %s, %s)", (count, 4, acol[0]));

	conn.commit()
	print "Records created successfully";
	conn.close()

if __name__ == '__main__':
	main()