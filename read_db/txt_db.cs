using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace Read_DB
{

    public class DB_TXT
    {
        public string db_path;

        private class PhanHoi
        {
            public bool ok;
            public string msg;
            public List<int> den;
            public List<int> quat;
            public int tv;
        }

        private List<int> doc_mang(string s)
        {
            List<int> L = new List<int>();
            string[] items = s.Split(new char[] { ' ', '\t' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string item in items)
            {
                int i = int.Parse(item);
                L.Add(i);
            }
            return L;
        }

        public string Read_db_txt()
        {
            PhanHoi p = new PhanHoi();
            try
            {
                //ko gui len gi
                //chi tra ve theo format dat truoc

                //ket noi db
                //sql
                //lay cac thong tin trong rows tra ve de gan cho p

                string noidung = System.IO.File.ReadAllText(db_path);

                string[] lines = noidung.Split(new char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
                string den = lines[0].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
                string quat = lines[1].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
                string tv = lines[2].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
                p.den = doc_mang(den);
                p.quat = doc_mang(quat);
                p.tv = int.Parse(tv);
                p.ok = true;
                p.msg = "ok";
            }
            catch (Exception ex)
            {
                p.ok = false;
                p.msg = "Lỗi rồi: " + ex.Message;
            }
            string json = JsonConvert.SerializeObject(p);
            return json;
        }
    }


    public class db_sqlserver
    {
        public string cnstr;
        public string get_status()
        {
            string json = "";
            try
            {
                /*
                 * 1: kết nối tới db
                 * 2: thực thi sp_api với action ='get_status'
                 * 3: thu về 1 chuỗi JSON
                 * 4: trả chuỗi cho thằng gọi
                 */

                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_API";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_status";
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch //(Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }

            return json;
        }
        public string control(int idSensor, int status)
        {
            string json = "";

            try
            {
                /*
                 * 1: kết nối tới db
                 * 2: thực thi sp_api với action mặc định
                 * 3: thu về 1 chuỗi
                 * 4: trả chuỗi cho thằng gọi
                 */

                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_API";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "control";
                        cmd.Parameters.Add("@idSensor", SqlDbType.Int).Value = idSensor;
                        cmd.Parameters.Add("@status", SqlDbType.Bit).Value = status;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch //(Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }

            return json;
        }
        public string get_history(int idSensor)
        {
            string json = "";
            try
            {
                /*
                 * 1: kết nối tới db
                 * 2: thực thi sp_api với action mặc định
                 * 3: thu về 1 chuỗi
                 * 4: trả chuỗi cho thằng gọi
                 */

                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_API";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_history";
                        cmd.Parameters.Add("@idSensor", SqlDbType.Int).Value = idSensor;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch //(Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }

            return json;
        }
    }
}
