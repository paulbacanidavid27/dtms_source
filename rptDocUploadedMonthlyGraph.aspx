﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Report.Master" CodeBehind="rptDocUploadedMonthlyGraph.aspx.vb" Inherits="dms.rptDocUploadedMonthlyGraph" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Document Uploaded Hourly Report</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" style="width:100%;">
        <LocalReport ReportPath="rptDocUploadedMonthlyGraph.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                    Name="rdsDeliverOnTIme" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RptConnString %>" 
        SelectCommand="dmsp_uploadhourly" SelectCommandType="Text">
    </asp:SqlDataSource>
      
</asp:Content>
