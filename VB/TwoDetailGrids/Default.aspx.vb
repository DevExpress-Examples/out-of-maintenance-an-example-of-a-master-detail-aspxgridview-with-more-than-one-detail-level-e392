Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports DevExpress.Web.ASPxGridView

Namespace TwoDetailGrids
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
		Protected Sub productsGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
			Session("SupplierID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
		End Sub
		Protected Sub orderItemsGrid_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
			Session("ProductID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
		End Sub
	End Class
End Namespace
