import psycopg2

try:
    conn = psycopg2.connect(
        host="localhost",
        port="5432",
        dbname="your_db_name",
        user="postgres",
        password="your_password"
    )
    print("✅ Connection successful")
    conn.close()
except Exception as e:
    print("❌ Connection failed:", e)