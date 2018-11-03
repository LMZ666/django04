from django.test import TestCase

import json
import pymysql

# 读取review数据，并写入数据库
# 导入数据库成功，总共4736897条记录
def prem(db):
    cursor = db.cursor()
    cursor.execute("SELECT VERSION()")
    data = cursor.fetchone()
    print("Database version : %s " % data)  # 结果表明已经连接成功



def reviewdata_insert(db):

    with open(r'F:\googleDownload\package\11-帮5淘\json\g-r-v.json', encoding='utf-8') as f:
        result = []
        imgs = json.load(f)
        # print(imgs)
        for img in imgs :
            result.append((img.get("img"),img.get("content"),img.get("price")))
            print(img.get("img"))
        print(len(result))
        inesrt_re = "insert into grv (img,content,price) values (%s,%s,%s)"
        cursor = db.cursor()
        cursor.executemany(inesrt_re, result)
        db.commit()


if __name__ == "__main__":  # 起到一个初始化或者调用函数的作用
    db = pymysql.connect("localhost", "root", "1234", "django04", charset='utf8')
    cursor = db.cursor()
    prem(db)
    reviewdata_insert(db)
    cursor.close()