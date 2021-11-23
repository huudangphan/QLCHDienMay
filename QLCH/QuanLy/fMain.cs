﻿using DevExpress.XtraBars;
using QuanLy.DonHangXuat;
using QuanLy.KhachHang;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLy
{
    public partial class fMain : DevExpress.XtraBars.FluentDesignSystem.FluentDesignForm
    {
        private int type;
      
        public fMain()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
            manv.Text = DataProvider.userName;
            hoten.Text = DataProvider.mHoTen;
            ch.Text = DataProvider.mGroup;
            
        }
        
        public int CheckType()
        {
            if (DataProvider.mGroup == "USER")
                return 0;
            else if (DataProvider.mGroup == "KETOAN")
                return 1;
            else if (DataProvider.mGroup == "KHO")
                return 2;
            else
                return 3;

        }
        
        
        private void accordionControlElement1_Click(object sender, EventArgs e)
        {
            
            
        }

        private void accordionControlElement3_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {
                ff.Controls.Clear();
                fDanhSachDHOnline f = new fDanhSachDHOnline();
                f.Dock = DockStyle.Fill;
                ff.Controls.Add(f);
            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement5_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement6_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {
                if (GlobalData.makh == "")
                    MessageBox.Show("Vui lòng chọn khách hàng trước!");
                else
                {
                    ff.Controls.Clear();
                    fTaoDonHangOffline f = new fTaoDonHangOffline();
                    f.Dock = DockStyle.Fill;
                    ff.Controls.Add(f);
                }
            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement14_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement15_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement9_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 2 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement10_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 2 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement11_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 2 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement17_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 1 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement18_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 1 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement19_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 1 || type == 3)
            {

            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }

        private void accordionControlElement20_Click(object sender, EventArgs e)
        {
            type = CheckType();
            if (type == 0 || type == 3)
            {
                ff.Controls.Clear();
                fDanhSachKhach f = new fDanhSachKhach();
                f.Dock = DockStyle.Fill;
                ff.Controls.Add(f);
            }
            else
                MessageBox.Show("Người dùng không có quyền truy cập!");
        }
    }
}