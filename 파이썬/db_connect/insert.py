import csv
import pymysql

def read_csv_write_mysql():
    file = open("charge.csv", "r", encoding='utf8')
    conn = pymysql.connect(host='192.168.0.104', user='root', password='1234', db='charge', charset='utf8')
    curs = conn.cursor()
    sql = "INSERT INTO charge.charge_spot " \
          "(organ, spot, spot_num, type, do, si, addr, using_time) " \
          "VALUES (%s, %s, %s, %s,%s, %s, %s, %s)"

    rd = csv.reader(file)

    for idx, line in enumerate(rd):

        # if idx == 0:
        #     print("continue 됨")
        #     continue
        row = str(line).split(',')
        try:
            # print(row[0].replace("[", "").replace("'", ""), row[1].replace("'", ""), row[2].replace("'", ""), row[3].replace("'", ""), row[4].replace("'", ""), row[5].replace("'", ""),row[6].replace("'", ""), row[7].replace("]", ""))
            curs.execute(sql, (row[0].replace("[", "").replace("'", "").lstrip(), row[1].replace("'", ""), row[2].replace("'", ""), row[3].replace("'", ""), row[4].replace("'", ""),row[5].replace("'", ""), row[6].replace("'", ""), row[7].replace("]", "").replace("'", "")))
            conn.commit()
        except Exception as e:
            print(e)
            print("ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ continue 됨")
            continue
    file.close()
