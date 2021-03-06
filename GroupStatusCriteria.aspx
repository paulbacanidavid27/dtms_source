﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="GroupStatusCriteria.aspx.vb" Inherits="dms.GroupStatusCriteria" EnableEventValidation="true" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ MasterType VirtualPath="~/Site.Master"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register src="UserControlDocumentIndex.ascx" tagname="UserControlDocumentIndex" tagprefix="uc" %>    
<%@ Register src="UserControlReport.ascx" tagname="UserControlReport" tagprefix="uc" %>    
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">    
        <script src="Scripts/print_report.js" type="text/javascript"></script>
        <title>Group Status - Report Criteria</title>
</asp:Content>

<%--menu content start--%>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="menuContent">    
    <uc:UserControlReport id="ucReport" runat="server" Visible="true"></uc:UserControlReport>       
</asp:Content>
<%--main headr content start--%>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="MainHeaderContent">
   
            <table border="0" width="100%" class="tblHdr_1">
      <tr>
                            <td><asp:Image ID="Image8" runat="server" width="20px" Height="20px" imageurl="images/task.png" />&nbsp;Group Status Report</td>
        </tr>
    </table>    
         
</asp:Content>
<%--main headr content end--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:UpdatePanel ID="pnlOffice" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate> 
      
    <asp:Panel id="pRepeater" runat="server" DefaultButton="btSearch">  
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td valign="top">
            <div style="width:100%;">
                
                <asp:Panel ID="idAdvSrch" runat="server" Visible="false" style="height:auto;width:100%">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                         <tr>
                            <td align="left">
                                
                                <table border="0"  cellspacing="1" cellpadding="3" width="100%" style="border:solid 1px #D4D4D4;">
                                    <tr>
                                        
                                        <td align="left" style="padding-left:10;font-style:italic;font-size:9pt;background-color:#CCCCCC" colspan="4" >
                                            Report Criteria
                                        </td>                                        
                                    </tr>          
                                    <tr>
                                    <td align="right" class="labelFreeForm"  style="padding-left:10">
                                                Office:
                                        </td>
                                        <td align="left" >
                                           
                                                    <asp:DropDownList ID="dlOfficeCode" runat="server" cssclass="entryfld2" Width="350px" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <asp:Label ID="lOfficeName" runat="server" Text="" Visible="false"></asp:Label>
                                            
                                        </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    </tr>                          
                                     <tr>
                                     <td align="right" class="labelFreeForm"  style="padding-left:10">
                                                Group:
                                        </td>
                                        <td align="left">
                                        <asp:UpdatePanel ID="pnlGroup" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                    <asp:DropDownList ID="dlGroup" runat="server" cssclass="entryfld2" Width="350px" AutoPostBack="false">
                                            </asp:DropDownList>
                                            <asp:Label ID="lGroupName" runat="server" Text="" Visible="false"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers><asp:AsyncPostBackTrigger ControlID="dlOfficeCode"  EventName="SelectedIndexChanged" /></Triggers>
                                        </asp:UpdatePanel>
                                        </td>
                                                                          
                                        
                                        
                                        
                                        <td align="right" width="150px"  class="labelFreeForm"  style="padding-left:10">
                                        Last Action:
                                            
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dlStatus" cssclass="entryfld2"  runat="server"  Width="250px">
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                     <td align="right"   class="labelFreeForm"  style="padding-left:10">
                                            Assigned Date Range:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tbADRFrom" runat="server" cssclass="entryfld"  Width="67px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbADRFrom" />

                                            -
                                            <asp:TextBox ID="tbADRTo" runat="server" cssclass="entryfld"  Width="67px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbADRTo"/>
                                        </td>
                                        <td align="right" class="labelFreeForm"  style="padding-left:10">
                                            Status:
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="dlDocStatus" cssclass="entryfld2"  runat="server"  Width="250px">
                                                <asp:ListItem Text="Open" Value="A">-All-</asp:ListItem>
                                                <asp:ListItem Text="Open" Value="O"></asp:ListItem>
                                                <asp:ListItem Text="Completed/Closed" Value="C"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>                                        
                                        
                                    </tr>
                                    <tr>
                                    <td align="right"   class="labelFreeForm"  style="padding-left:10" title="Upload Date">
                                            Received Date Range:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tbRDRFrom" runat="server" cssclass="entryfld"  Width="67px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="tbRDRFrom" />

                                            -
                                            <asp:TextBox ID="tbRDRTo" runat="server" cssclass="entryfld"  Width="67px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="tbRDRTo"/>
                                        </td>
                                        
                                         <td align="RIGHT" width="150px"  class="labelFreeForm"  style="padding-left:10">
                                        Uploaded By:
                                            
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tbAuthor" runat="server" cssclass="entryfld" AutoComplete="off"  Width="249px"> </asp:TextBox>
                                            <cc1:autocompleteextender runat="server" ID="acomplete" TargetControlID="tbAuthor"
                                                 ServiceMethod="getUsers" ServicePath="getUser.asmx" CompletionInterval="800" EnableCaching="true"
                                                  MinimumPrefixLength="1" FirstRowSelected="false"
                                                 completionsetcount="25" />
                                        </td>
                                    </tr>
                                    <tr>
                                     <td align="RIGHT"class="labelFreeForm"  style="padding-left:10">
                                        Document Type:
                                            
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="lbDocType" runat="server" cssclass="entryfld2"  Width="350px" AutoPostBack="true">
                                            </asp:DropDownList>
                                          
                                            
                                        </td>    
                                        <td align="right" class="labelFreeForm"  style="padding-left:10" >Personnel-in-charge:</td>
                                        <td>
                                        <asp:TextBox ID="tbPersonnel" runat="server" cssclass="entryfld" AutoComplete="on"   Width="249px"> </asp:TextBox></td>
                                       
                                    </tr>
                                    <tr>
                                    <td title="For multiple document no, separate it with comma" align="right"   class="labelFreeForm"  style="padding-left:10">Document No:
                                    </td>
                                    <td>
                                    <asp:TextBox ID="tbDocNo" runat="server" cssclass="entryfld" Width="350px"> </asp:TextBox>
                                    </td>
                                    <td class="labelFreeForm"  align="right" style="padding-left:10" >Remarks:</td><td><asp:TextBox ID="tbRemarks"   Width="249px" runat="server" cssclass="entryfld"> </asp:TextBox></td></tr>
                                    <tr>
                                        
                                        <td align="left" style="padding-left:10;font-style:italic;font-size:9pt;background-color:#CCCCCC" colspan="4" >
                                            Sort Option
                                        </td>                                        
                                    </tr>     
                                     <tr>
                                        <td class="labelFreeForm"  align="right">
                                            Column Sort:
                                            
                                        </td>
                                        <td colspan="3">

                                            <asp:DropDownList ID="dlColumns" runat="server" Visible="true" AutoPostBack="false" 
                                                cssclass="entryfld2" Width="210px">
                                                <asp:ListItem Text="Personnel In-Charge" Value="assignedto" Selected="False"></asp:ListItem>
                                                <asp:ListItem Text="Document No" Value="dl.refno" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Subject/Title" Value="dl.Title" Selected="False"></asp:ListItem>                                                
                                                <asp:ListItem Text="Document Type" Value="dt.DocName" Selected="False"></asp:ListItem>                                                
                                                <asp:ListItem Text="Status" Value="statusdesc" Selected="False"></asp:ListItem>
                                                <asp:ListItem Text="Action Taken" Value="statremarks" Selected="False"></asp:ListItem>
                                                <asp:ListItem Text="Action Date" Value="actdate" Selected="False"></asp:ListItem>
                                                <asp:ListItem Text="Received Date" Value="cdate" Selected="False"></asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="labelFreeForm"  align="right">
                                            Sort Order:
                                            
                                        </td>
                                        <td  colspan="3">

                                            <asp:DropDownList ID="dlSortOption" runat="server" Visible="true" AutoPostBack="false" 
                                                cssclass="entryfld2" Width="210px">
                                                <asp:ListItem Text="Ascending" Value="asc" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Descending" Value="desc" Selected="False"></asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                    <tr><td colspan="3">
                                        <asp:CheckBox ID="cbSummary" runat="server" Text="Show Summary Report Only" /></td>
                                    <td align="right" ><asp:Button ID="btSearch" runat="server" CssClass="btn" Text="Preview" style="margin:3px 3px 3px 3px"/></td></tr>
                                </table>
                            </td>
                         </tr>
                         
                         <tr>
                            <td style="text-align:CENTER;">
                                <asp:Label ID="msg" runat="server" Text="" CssClass="msg_red"></asp:Label></td>
                         </tr>
                    </table>        
                </asp:Panel>
                              
              
                
            </div>
        </td>        
    </tr>
    </table>
    
   
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
<asp:PostBackTrigger ControlID="btSearch" /></Triggers>
                                            </asp:UpdatePanel>
</asp:Content>
