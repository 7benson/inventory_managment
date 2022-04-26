import psycopg2


def write_blob(part_id, path_to_file, file_extension):
    """ insert a BLOB into a table """
    conn = None
    try:
        # read data from a picture
        drawing = open(path_to_file, 'rb').read()
        # read database configuration
        # connect to the PostgresQL database
        conn = psycopg2.connect(dbname="inventory", user="postgres", password="root")
        # create a new cursor object
        cur = conn.cursor()
        # execute the INSERT statement
        cur.execute("INSERT INTO image_gallery(id,file_extension,image) " +
                    "VALUES(%s,%s,%s)",
                    (part_id, file_extension, psycopg2.Binary(drawing)))
        # commit the changes to the database
        conn.commit()
        # close the communication with the PostgresQL database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

def read_blob(part_id, path_to_dir):
    """ read BLOB data from a table """
    conn = None
    try:
        # read database configuration
        # connect to the PostgresQL database
        conn = psycopg2.connect(dbname="inventory", user="postgres", password="root")
        # create a new cursor object
        cur = conn.cursor()
        # execute the SELECT statement
        cur.execute(""" SELECT id, file_extension, image
                        FROM image_gallery
                        WHERE id = %s """,
                    (part_id,))

        blob = cur.fetchone()
        open(path_to_dir + str(blob[0]) + '.' + blob[1], 'wb').write(blob[2])
        # close the communication with the PostgresQL database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    write_blob(1, 'images/mens/shirts/1.jpg', 'jpg')
    write_blob(2, 'images/mens/shirts/2.jpg', 'jpg')
    write_blob(3, 'images/mens/shirts/3.jpg', 'jpg')

    write_blob(4, 'images/mens/shirts/4.jpg', 'jpg')
    write_blob(5, 'images/mens/shirts/5.jpg', 'jpg')
    write_blob(6, 'images/mens/shirts/6.jpg', 'jpg')
    
    write_blob(7, 'images/mens/jeans/1.jpg', 'jpg')
    write_blob(8, 'images/mens/jeans/2.jpg', 'jpg')
    write_blob(9, 'images/mens/jeans/3.jpg', 'jpg')

    write_blob(10, 'images/mens/jeans/4.jpg', 'jpg')
    write_blob(11, 'images/mens/jeans/5.jpg', 'jpg')
    write_blob(12, 'images/mens/jeans/6.jpg', 'jpg')
    
    # read_blob('1', './',)

