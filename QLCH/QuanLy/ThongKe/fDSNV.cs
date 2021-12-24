﻿using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.ThongKe
{
    public partial class fDSNV : DevExpress.XtraEditors.XtraUserControl
    {
        string pathSave = "";
        public fDSNV()
        {
            InitializeComponent();
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
                {
                    var path = folderBrowserDialog1.SelectedPath;
                    if (!string.IsNullOrEmpty(path.ToString()))
                    {
                        pathSave = path.ToString();
                        MessageBox.Show("Chọn đường dẫn thành công", "Thông báo", MessageBoxButtons.OK);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBox1.Text))
                MessageBox.Show("Tên file không được để trống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                string filename = textBox1.Text;
                rptDSNV f = new rptDSNV();              

                string query = "sp_DSNV";
                SqlDataAdapter adapter = new SqlDataAdapter(query, DataProvider.conn);
                adapter.SelectCommand = new SqlCommand(query, DataProvider.conn);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                
                DataSet ds = new DataSet();
                if (DataProvider.conn.State == System.Data.ConnectionState.Closed)
                {
                    DataProvider.conn.Open();

                }
                try
                {
                    adapter.Fill(ds);
                    f.DataSource = ds;
                    f.DataMember = ds.Tables[0].TableName;
                    f.ExportToPdf(pathSave + @"\" + filename + ".pdf");

                    MessageBox.Show("Xuất file thành công");

                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString());


                }
            }
        }
    }
}
