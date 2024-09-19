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
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string action = this.Request["action"];
          
            switch (action)
            {
                case "get_status":
                    get_status();
                    break;
                case "get_history":
                    get_history();
                    break;
                case "control":
                    control();
                    break;
                default:
                    thong_bao_loi();
                    break;
            }
        }
        void control()
        {
            //phần cứng làm việc xong, nhận phản hồi xác thực
            //thì mới gọi hàm này để lưu db: cập nhật trạng thái+lưu history
            int idSensor = int.Parse(this.Request["id"]);
            int status = int.Parse(this.Request["status"]);

            control_nodered.dieu_khien ct = new control_nodered.dieu_khien();
            ct.dk(idSensor, status);

            Read_DB.db_sqlserver db = get_db();
            string json = db.control(idSensor, status);
            this.Response.Write(json);
        }
        void thong_bao_loi()
        {
            string rep = "{\"ok\":false,\"msg\":\"Lỗi rồi nhé, ko có action này!\"}";
            this.Response.Write(rep);
        }
        Read_DB.db_sqlserver get_db()
        {
            //dùng DLL để đọc mydb.txt
            //Read_DB.DB_TXT db = new Read_DB.DB_TXT();
            //db.db_path = Server.MapPath("mydb.txt");
            //string json = db.Read_db_txt();
            //this.Response.Write(json);

            Read_DB.db_sqlserver db = new Read_DB.db_sqlserver();
            db.cnstr = "Server=MIU-LAPTOP\\SQLEXPRESS;Database=MonitorRoom;User Id=sa;Password=123;";
            return db;
        }


        void get_status()
        {
            //dùng DLL để đọc mydb.txt
            //Read_DB.DB_TXT db = new Read_DB.DB_TXT();
            //db.db_path = Server.MapPath("mydb.txt");
            //string json = db.Read_db_txt();
            //this.Response.Write(json);

            Read_DB.db_sqlserver db = get_db();
            string json = db.get_status();
            this.Response.Write(json);
        }

        void get_history()
        {
            Read_DB.db_sqlserver db = get_db();
            int idSensor = int.Parse(this.Request["id"]);
            string json = db.get_history(idSensor);
            this.Response.Write(json);
        }

        
    }
}