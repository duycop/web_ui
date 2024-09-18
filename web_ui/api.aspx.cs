using Newtonsoft.Json;
using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_ui
{
    public partial class api : System.Web.UI.Page
    {
        //class PhanHoi
        //{
        //    public bool ok;
        //    public string msg;
        //    public List<int> den;
        //    public List<int> quat;
        //    public int tv;
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            //PhanHoi p = new PhanHoi();
            //try
            //{
            //    //ko gui len gi
            //    //chi tra ve theo format dat truoc
                
            //    //ket noi db
            //    //sql
            //    //lay cac thong tin trong rows tra ve de gan cho p

            //    string db_path = Server.MapPath("mydb.txt");
            //    string noidung = System.IO.File.ReadAllText(db_path);

            //    string[] lines = noidung.Split(new char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
            //    string den = lines[0].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
            //    string quat = lines[1].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
            //    string tv = lines[2].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries)[1];
            //    p.den = doc_mang(den);
            //    p.quat = doc_mang(quat);
            //    p.tv = int.Parse(tv);
            //    p.ok = true;
            //    p.msg = "ok";
            //}catch(Exception ex)
            //{
            //    p.ok = false;
            //    p.msg = "Lỗi rồi: "+ex.Message;
            //}
            //string json = JsonConvert.SerializeObject(p);
            //this.Response.Write(json);


            //code khi về đến nhà, ăn cơm xong: chuyển code đọc db txt vào class => DLL
            //những phần đã chuyển sang class DLL thì cho vào comment.

            //dùng DLL để đọc mydb.txt
            Read_DB.DB_TXT db = new Read_DB.DB_TXT();
            db.db_path= Server.MapPath("mydb.txt");
            string json =  db.Read_db_txt();
            this.Response.Write(json);
        }

        //List<int> doc_mang(string s)
        //{
        //    List<int> L = new List<int>();
        //    string[] items = s.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
        //    foreach (string item in items)
        //    {
        //        int i = int.Parse(item);
        //        L.Add(i);
        //    }
        //    return L;
        //}
    }
}