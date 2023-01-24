﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TwoDetailGrids._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxwgv" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxw" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%-- BeginRegion DataSource --%>
        <dxwgv:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" 
            DataSourceID="masterDataSource" KeyFieldName="SupplierID" Width="100%">
        <%-- BeginRegion Grid Columns --%>
            <Columns>
                <dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="1">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="2">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="2">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="Region" Visible="false">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
                </dxwgv:GridViewDataColumn>
            </Columns>
        <%-- EndRegion --%>
            <Templates>
                <DetailRow>
                        <dxwgv:ASPxGridView ID="productsGrid" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="productsDataSource" 
                            KeyFieldName="ProductID" OnBeforePerformDataSelect="productsGrid_DataSelect" 
                            Width="100%">
                            <Templates>
                                <DetailRow>
                                    <dxwgv:ASPxGridView ID="orderItemsGrid" runat="server" 
                                        AutoGenerateColumns="False" DataSourceID="orderItemsDataSource" 
                                        KeyFieldName="OrderID" 
                                        onbeforeperformdataselect="orderItemsGrid_BeforePerformDataSelect">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" 
                                                VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" 
                                                VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsDetail IsDetailGrid="True" />
                                    </dxwgv:ASPxGridView>
                                </DetailRow>
                            </Templates>
                            <Columns>
                                <dxwgv:GridViewDataColumn FieldName="ProductName" VisibleIndex="0">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="CategoryName" VisibleIndex="1">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="QuantityPerUnit" VisibleIndex="2">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="c">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataColumn FieldName="UnitsInStock" VisibleIndex="4">
                                </dxwgv:GridViewDataColumn>
                                <dxwgv:GridViewDataColumn FieldName="Discontinued" VisibleIndex="5">
                                </dxwgv:GridViewDataColumn>
                            </Columns>
                            <SettingsDetail IsDetailGrid="True" ShowDetailRow="True" />
                        </dxwgv:ASPxGridView>
                </DetailRow>
            </Templates>
            <SettingsDetail ShowDetailRow="true" />
            <Settings ShowGroupPanel="True" />
            <SettingsCustomizationWindow Enabled="True" />
        </dxwgv:ASPxGridView>
        <asp:AccessDataSource ID="masterDataSource" runat="server" 
            DataFile="~/App_Data/nwind.mdb" 
            SelectCommand="SELECT * FROM [Suppliers]"></asp:AccessDataSource>
        <%-- BeginRegion Grid Columns --%>
        <asp:AccessDataSource ID="productsDataSource" runat="server" 
            DataFile="~/App_Data/nwind.mdb" 
            SelectCommand="SELECT p.ProductID, p.ProductName, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.Discontinued, c.CategoryName  FROM [Products] p, [Categories] c Where p.CategoryID = c.CategoryID and p.SupplierID = ?">
            <SelectParameters>
                <asp:SessionParameter Name="SupplierID" SessionField="SupplierID" 
                    Type="int32" />
            </SelectParameters>
        </asp:AccessDataSource>
            <asp:AccessDataSource ID="orderItemsDataSource" runat="server" 
        DataFile="~/App_Data/nwind.mdb" 
        SelectCommand="SELECT [OrderID], [ProductID], [Quantity] FROM [Order Details] WHERE ([ProductID] = ?)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="ProductID" 
                SessionField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    </div>
    </form>
    </body>
</html>
