using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sacheon.Sql
{
    class query
    {
        #region Method

        public String Dust_chk(Dictionary<string, string> param) 
        {

            string _sql  = "SELECT IFNULL(COUNT(*), 0) AS CNT";
                   _sql += "  FROM js_dust";
                   _sql += " WHERE DATATIME = '" +param["DATATIME"] + "'";
                   _sql += "   AND SIDONAME = '" + param["SIDONAME"] + "'";
                   _sql += "   AND STATIONNAME = '" + param["STATIONNAME"] + "'";


            return _sql;
        }

        public string SetDustData(Dictionary<string, string> param) 
        {
             string _sql = "INSERT INTO js_dust (";
                    _sql += "  DATATIME    ";
                    _sql += ", SIDONAME    ";
                    _sql += ", STATIONNAME ";
                    _sql += ", PM10VALUE   ";
                    _sql += ", PM25VALUE   ";
                    _sql += ", PM10GRADE   ";
                    _sql += ", PM25GRADE   ";
                    _sql += ", SO2VALUE    ";
                    _sql += ", COVALUE     ";
                    _sql += ", O3VALUE     ";
                    _sql += ", NO2VALUE    ";
                    _sql += ", SO2GRADE    ";
                    _sql += ", COGRADE     ";
                    _sql += ", O3GRADE     ";
                    _sql += ", NO2GRADE    ";
                    _sql += ", KHAIVALUE   ";
                    _sql += ", KHAIGRADE   ";
                    _sql += ", INS_DATE    ";

                    _sql += ") VALUES (";
                    _sql += "  '" + param["DATATIME"]  +"' ";
                    _sql += ", '" + param["SIDONAME"] + "' ";
                    _sql += ", '" + param["STATIONNAME"] + "' ";
                    _sql += ", '" + param["PM10VALUE"] + "' ";
                    _sql += ", '" + param["PM25VALUE"] + "' ";
                    _sql += ", '" + param["PM10GRADE"] + "' ";
                    _sql += ", '" + param["PM25GRADE"] + "' ";
                    _sql += ", '" + param["SO2VALUE"] + "' ";
                    _sql += ", '" + param["COVALUE"] + "' ";
                    _sql += ", '" + param["O3VALUE"] + "' ";
                    _sql += ", '" + param["NO2VALUE"] + "' ";
                    _sql += ", '" + param["SO2GRADE"] + "' ";
                    _sql += ", '" + param["COGRADE"] + "' ";
                    _sql += ", '" + param["O3GRADE"] + "' ";
                    _sql += ", '" + param["NO2GRADE"] + "' ";
                    _sql += ", '" + param["KHAIVALUE"] + "' ";
                    _sql += ", '" + param["KHAIGRADE"] + "' ";
                    _sql += ", '" + param["NOW"] + "' ";

            _sql += ") ";
           
            return _sql;
        }
        #endregion
    }
}
