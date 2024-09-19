using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

namespace control_nodered
{
    public class dieu_khien
    {
        public void dk(int id, int status)
        {
            // URL bạn muốn gửi POST request
            string url = "http://127.0.0.1:1880/dieu_khien"; // Thay bằng URL của bạn

            // Tạo nội dung JSON
            string json = "{\"id\":" + id.ToString() + ",\"status\":" + status.ToString() + "}";

            // Tạo nội dung của yêu cầu POST
            StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                // Khởi tạo HttpClient
                HttpClient client = new HttpClient();

                // Gửi POST request đồng bộ
                HttpResponseMessage response = client.PostAsync(url, content).Result;

                // Kiểm tra kết quả trả về
                if (response.IsSuccessStatusCode)
                {
                    string responseBody = response.Content.ReadAsStringAsync().Result;
                    Console.WriteLine("Response: " + responseBody);
                }
                else
                {
                    Console.WriteLine($"Error: {response.StatusCode}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }
    }
}
