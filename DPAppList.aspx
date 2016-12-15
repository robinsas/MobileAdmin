﻿<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" 
    CodeFile="DPAppList.aspx.vb" Inherits="DPAppList" title="Decline Partner Processing"%>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">     
                   
           <telerik:RadScriptManager ID="RadScriptManager1" runat="server" >
               <Scripts>
                   <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                   </asp:ScriptReference>
                   <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                   </asp:ScriptReference>
                   <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                   </asp:ScriptReference> 
               </Scripts> 
           </telerik:RadScriptManager> 
              <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                 <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                 </AjaxSettings>
           </telerik:RadAjaxManager>
          <table class="centered-cell" style="width: 100%">
              <tr>
                <td class="centered-cell" style="padding: 1px; font-family: Arial, Helvetica, sans-serif; font-size: small; border-top-color: #A0A0A0; border-right-color: #C0C0C0; border-bottom-color: #C0C0C0; border-left-color: #A0A0A0; font-weight: bold; ">
                    ARF Decline Processing<br />
                </td>
             </tr>
             <tr><td>&nbsp;</td></tr>
        </table>
        <table class="centered-cell" style="width: 100%; font-family:arial; font-size:small;" >
               <tr>
                 <td class="centered-cell" >
                   Status:
                   <asp:DropDownList ID="StatusList" runat="server" AutoPostBack="True" Width="80px">
                   <asp:ListItem Selected="True" Value="ALL">ALL</asp:ListItem>
                   <asp:ListItem>New</asp:ListItem>
                   <asp:ListItem>Awaiting Rep Approval</asp:ListItem>
                   <asp:ListItem>In Process</asp:ListItem>
                   <asp:ListItem>Declined</asp:ListItem>
                   <asp:ListItem>Funded - Awaiting Comm</asp:ListItem>
                   <asp:ListItem>Funded - Received Comm</asp:ListItem>
                   <asp:ListItem>Back to ARF</asp:ListItem>
                   <asp:ListItem>Removed</asp:ListItem>
                   </asp:DropDownList>
                </td>
                <td>  
                   Start Date: <telerik:RadDatePicker ID="StartDate1" Runat="server" AutoPostBack="True" 
                    MinDate ="2012-01-01" Width="100px" Culture="en-US" FocusedDate="2012-01-01" WrapperTableCaption="" WrapperTableSummary="">
                   <Calendar runat="server"  ShowRowHeaders="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                   <DateInput runat="server" DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" AutoPostBack="True" LabelWidth="40%" ReadOnly="True"></DateInput>
                   <DatePopupButton></DatePopupButton>
                   </telerik:RadDatePicker>
               </td>
               <td>
                  Reason:
                  <asp:DropDownList ID="ReasonList" runat="server" AutoPostBack="True" Width="80px">
                  </asp:DropDownList>
               </td>
               <td>
                  Partner:
                  <asp:DropDownList ID="PartnerList" runat="server" AutoPostBack="True" Width="80px">
                  </asp:DropDownList>
               </td>
               <td>
                  Rep:
                  <asp:DropDownList ID="RepList" runat="server" AutoPostBack="True" Width="80px">
                  </asp:DropDownList>
               </td>
                   <td>
                  Merchant:<asp:TextBox ID="MerchSearch" runat="server" Width="80px"></asp:TextBox>
                  <asp:Button ID="MerchSearchButton" runat="server" Text="Search" Width="60px" />&nbsp;</td>
                <td>&nbsp;</td>
               <td>
                  <asp:Button ID="ResetButton" runat="server" Text="Reset" Width="60px"/>&nbsp;
               </td>
               <td>&nbsp;</td>
               <td>
                   <asp:Button ID="AddButton" runat="server" Text="Add App" BackColor="#99CCFF" Width="80px" />&nbsp;
               </td>
               <td>&nbsp;</td>
               <td>
                   <asp:ImageButton ID="ExcelButton" runat="server" Height="25px" ImageUrl="Image/excel.png" Width="30px" />
               </td>
             </tr>
         </table>
        <p></p>
        <table class="centered-cell" style="width:100%">
             <tr>
             <td  style="text-align:center; width: 994px;">
                 <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" PageSize="15" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_RowCommand">
                     <MasterTableView>
                         <Columns>
                             <telerik:GridBoundColumn datafield="LoanNumber" HeaderText="App #" dataformatstring="{0:F0}" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridButtonColumn buttontype="ImageButton" ImageUrl="image/edit.png" commandname="Mod" UniqueName="Mod" />
                             <telerik:GridButtonColumn buttontype="ImageButton" ImageUrl="image/deletered.png" commandname="Del" UniqueName="Del" />
                             <telerik:GridBoundColumn DataField="CommissionLock" display="false" />
                             <telerik:GridBoundColumn DataField="UnDeclined" display="false" />
                             <telerik:GridBoundColumn DataField="UnDeclinedDate" display="false" />
                             <telerik:GridBoundColumn DataField="MerchantName" HeaderText="Merchant" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="SalesRep" HeaderText="Sales Rep" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="CurrentStatus" HeaderText="Status" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="DeclinedDate" HeaderText="Decline Date" DataFormatString="{0:MM/dd/yyyy}" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="ReasonDesc" HeaderText="Decline Reason" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="PartnerName" HeaderText="Partner" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="PartnerSubmitDate" HeaderText="Submit Date" DataFormatString="{0:MM/dd/yyyy}" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="PartnerActionDate" HeaderText="Action Date" DataFormatString="{0:MM/dd/yyyy}" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                             <telerik:GridBoundColumn DataField="PartnerFundAmt" HeaderText="Fund Amt" DataFormatString="{0:c2}" itemstyle-horizontalalign="right" HeaderStyle-HorizontalAlign="right" />
                             <telerik:GridBoundColumn DataField="ARFCommissionDue" HeaderText="ARF Comm" DataFormatString="{0:c2}" itemstyle-horizontalalign="right" HeaderStyle-HorizontalAlign="right" />
                             <telerik:GridBoundColumn DataField="CommissionReceivedDate" HeaderText="Comm Rcvd Date" DataFormatString="{0:MM/dd/yyyy}" itemstyle-horizontalalign="left" HeaderStyle-HorizontalAlign="Left" />
                        </Columns>
                     </MasterTableView>        
                     <ExportSettings ExportOnlyData="True" FileName="DeclinePartnerExport" HideStructureColumns="True" IgnorePaging="True" OpenInNewWindow="True">
                         <Excel Format="Biff" />
                     </ExportSettings>
                     <ClientSettings>
                         <Scrolling AllowScroll="False" UseStaticHeaders="True" />
                     </ClientSettings>
                 </telerik:RadGrid>
           </td>
           </tr>
          </table>
          
</asp:Content>