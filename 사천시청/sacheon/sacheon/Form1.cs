using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Threading;
using System.Windows.Forms;
using System.Xml;
using System.Data;
using sacheon.Utill;
using sacheon.Sql;

namespace sacheon
{
    public partial class Form1 : Form
    {
        #region Variable
        bool _chk;
        Point fPt;
        Thread t2;
        ManualResetEvent _pauseEvebt = new ManualResetEvent(false);

        bool _thread_chk = false;

        string key = "zG8nq9EBZiH0aC5D3TedwddfSNgrBokygTQ6wBZTGfhuVWKz%2BMyxBg8SaOKv3WCcugECXKCK5yOGpdpCfBX1%2Fw%3D%3D";
        string _url_dust = string.Empty;
        
        int _sec = 1000;
        string SidoCode = string.Empty;

        DatabaseUtill db_utill = new DatabaseUtill();
        query _query = new query();
        #endregion

        #region Contstructor
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            btnStart.ForeColor = Color.FromArgb(255,255,255);
            btnEnd.ForeColor = Color.FromArgb(255, 255, 255);
        }

        #endregion

        #region Event
        private void btn_close_Click(object sender, EventArgs e)
        {
            _thread_chk = false;
            try
            {
                if (t2 != null)
                {
                    t2.Interrupt();
                }

                if (textBox_log.Text != "")
                {
                    string FilePath = Application.StartupPath + @"\Logs\" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".log";

                    string DirPath = Application.StartupPath + @"\Logs";

                    string temp;

                    DirectoryInfo di = new DirectoryInfo(DirPath);

                    FileInfo fi = new FileInfo(FilePath);

                    try
                    {
                        if (di.Exists != true) Directory.CreateDirectory(DirPath);

                        if (fi.Exists != true)
                        {
                            using (StreamWriter sw = new StreamWriter(FilePath))
                            {

                                temp = string.Format("{0}", textBox_log.Text);

                                sw.WriteLine(temp);

                                sw.Close();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }

                this.Close();

            }
            catch (Exception ex)
            {

            }
        }
        private void btnStart_Click(object sender, EventArgs e)
        {
            btnStart.Enabled = false;
            btnEnd.Enabled = true;

            btnStart.Image = Properties.Resources.button01;
            btnEnd.Image = Properties.Resources.button02_02;
            
            textBox_log.AppendText(DateTime.Now.ToString() + " | 수집 작업을 시작합니다." + Environment.NewLine);

            _thread_chk = true;

            _sec = 60 * 1000 * 10;

            t2 = new Thread(() => SetDustData());
            t2.Start();
         
            _pauseEvebt.Reset();

        }

        private void btnEnd_Click(object sender, EventArgs e)
        {
            btnStart.Enabled = true;
            btnEnd.Enabled = false;


            btnStart.Image = Properties.Resources.button01_01;
            btnEnd.Image = Properties.Resources.button02;

            _thread_chk = false;

            if (t2 != null)
            {
                t2.Interrupt();
            }

            textBox_log.AppendText(DateTime.Now.ToString() + " | 수집 작업을 중지합니다." + Environment.NewLine);

            _pauseEvebt.Set();
        }

        private void panel_title_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left) { _chk = true; fPt = e.Location; }
        }

        private void panel_title_MouseMove(object sender, MouseEventArgs e)
        {
            trans_point(e);
        }

        private void panel_title_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left) { _chk = false; fPt = e.Location; }
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left) { _chk = true; fPt = e.Location; }
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            trans_point(e);
        }

        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left) { _chk = false; fPt = e.Location; }
        }

        #endregion

        #region Method

        /// <summary>
        /// 폼 위치 이동
        /// </summary>
        /// <param name="e"></param>
        private void trans_point(MouseEventArgs e)
        {
            if (_chk) Location = new Point(Location.X + (e.X - fPt.X), Location.Y + (e.Y - fPt.Y));
        }

        
        /// <summary>
        /// 미세먼지 데이터 스레드
        /// </summary>
        private void SetDustData()
        {
            try
            {
                while (_thread_chk)
                {
                    GetSidoDust();

                    Thread.Sleep(_sec);
                }
            }
            catch (Exception ex)
            {
            }
        }

        /// <summary>
        /// 미세먼지
        /// </summary>
        private void GetSidoDust()
        {
            _url_dust = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
            _url_dust += "?serviceKey=" + key;
            _url_dust += "&returnType=xml";
            _url_dust += "&pageNo=1";
            _url_dust += "&numOfRows=1000";
            _url_dust += "&sidoName=경남";
            _url_dust += "&ver=1.0";

            XmlTextReader reader = new XmlTextReader(_url_dust);

            string _nodeType = string.Empty;
            string _so2Grade = string.Empty;
            string _khaiValue = string.Empty;
            string _so2Value = string.Empty;
            string _coValue = string.Empty;
            string _o3Grade = string.Empty;
            string _pm10Value = string.Empty;
            string _khaiGrade = string.Empty;
            string _pm25Value = string.Empty;
            string _sidoName = string.Empty;
            string _no2Grade = string.Empty;
            string _pm25Grade = string.Empty;
            string _dataTime = string.Empty;
            string _coGrade = string.Empty;
            string _no2Value = string.Empty;
            string _stationName = string.Empty;
            string _pm10Grade = string.Empty;
            string _o3Value = string.Empty;

            bool _End_chk = false;

            try
            {
                while (reader.Read())
                {
                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:

                            _nodeType = reader.Name.ToString();

                            break;
                        case XmlNodeType.Text:

                            switch (_nodeType)
                            {
                                case "so2Grade":
                                    _so2Grade = reader.Value;
                                    break;

                                case "khaiValue":
                                    _khaiValue = reader.Value;
                                    break;

                                case "so2Value":
                                    _so2Value = reader.Value;
                                    break;

                                case "coValue":
                                    _coValue = reader.Value;
                                    break;

                                case "o3Grade":
                                    _o3Grade = reader.Value;
                                    break;

                                case "pm10Value":
                                    _pm10Value = reader.Value;
                                    break;

                                case "khaiGrade":
                                    _khaiGrade = reader.Value;

                                    break;
                                case "pm25Value":
                                    _pm25Value = reader.Value;

                                    break;

                                case "sidoName":
                                    _sidoName = reader.Value;

                                    break;

                                case "no2Grade":
                                    _no2Grade = reader.Value;

                                    break;

                                case "pm25Grade":
                                    _pm25Grade = reader.Value;

                                    break;
                                case "dataTime":
                                    _dataTime = reader.Value;

                                    break;
                                case "coGrade":
                                    _coGrade = reader.Value;

                                    break;
                                case "no2Value":
                                    _no2Value = reader.Value;

                                    break;
                                case "stationName":
                                    _stationName = reader.Value;

                                    break;

                                case "pm10Grade":
                                    _pm10Grade = reader.Value;

                                    break;

                                case "o3Value":
                                    _o3Value = reader.Value;

                                    _End_chk = true;
                                    break;
                            }

                            break;
                    }

                    if (_End_chk)
                    {
                        if (_stationName == "사천읍")
                        {
                            var param = new Dictionary<string, string>();

                            param.Add("SO2GRADE", _so2Grade);
                            param.Add("KHAIVALUE", _khaiValue);
                            param.Add("SO2VALUE", _so2Value);
                            param.Add("COVALUE", _coValue);
                            param.Add("O3GRADE", _o3Grade);
                            param.Add("PM10VALUE", _pm10Value);
                            param.Add("KHAIGRADE", _khaiGrade);
                            param.Add("PM25VALUE", _pm25Value);
                            param.Add("SIDONAME", _sidoName);
                            param.Add("NO2GRADE", _no2Grade);
                            param.Add("PM25GRADE", _pm25Grade);
                            param.Add("DATATIME", _dataTime);
                            param.Add("COGRADE", _coGrade);
                            param.Add("NO2VALUE", _no2Value);
                            param.Add("STATIONNAME", _stationName);
                            param.Add("PM10GRADE", _pm10Grade);
                            param.Add("O3VALUE", _o3Value);

                            param.Add("NOW", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

                          
                            SetDust(param, _dataTime);

                        }

                        _End_chk = false;
                    }
                }
            }
            catch (Exception ex)
            {
            }
           
        }

        /// <summary>
        /// 미세먼지 저장
        /// </summary>
        /// <param name="param"></param>
        /// <param name="_districtName"></param>
        /// <param name="_dataDate"></param>
        private void SetDust(Dictionary<string, string> param, string _dataTime)
        {
            
            DataSet ds = db_utill.SelectCommand(_query.Dust_chk(param));

            if (Convert.ToInt32(ds.Tables[0].Rows[0]["CNT"]?.ToString()) < 1)
            {
                textBox_log.Invoke(new MethodInvoker(delegate ()
                {
                    textBox_log.AppendText(DateTime.Now.ToString() + " | " + _dataTime + " 미세먼지 데이터를 수집합니다." + Environment.NewLine);
                }));

                db_utill.ExecuteNonCommand(_query.SetDustData(param));
            }
            
        }

        private void OnMsgBox(string title, string msg_str, int sec = 1000)
        {
            /*
            msg.MessageTitle = title;
            msg.Message = msg_str;
            msg.MessageType = Config.MessageboxType.Nomal;
            msg.ShowDialog(this);
            */
        }
        #endregion
    }
}
