using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class OnlineStore : System.Web.UI.Page

{
    //sql server stuff
    SqlConnection objConn;
    SqlDataReader reader;
    DataSet objDS = new DataSet();
    DataRow objDR;
    static DataTable objCartDT;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Read the connection string from Web.config
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
        // Initialize connection
        objConn = new SqlConnection(connectionString);
        // Create command to read the help desk subjects
        SqlCommand subjectComm = new SqlCommand(
                "SELECT * from EmployeeStore", objConn);
        if (!IsPostBack)
        {
            pnlShowCart.Visible = false;
            try
            {
                // Open the connection
                objConn.Open();
                reader = subjectComm.ExecuteReader();
                dlItems.DataSource = reader;
                dlItems.DataBind();
            }
            finally
            {
                // Close the connection
                objConn.Close();
            }
            objCartDT = (DataTable)Session["Cart"];
            if (objCartDT == null)
            {
                objCartDT = new DataTable("Cart");
                objCartDT.Columns.Add("CartID", System.Type.GetType("System.Decimal"));
                objCartDT.Columns["CartID"].AutoIncrement = true;
                objCartDT.Columns["CartID"].AutoIncrementSeed = 1;
                objCartDT.Columns.Add("ItemID", System.Type.GetType("System.Int32"));
                objCartDT.Columns.Add("Quantity", System.Type.GetType("System.Int32"));
                objCartDT.Columns.Add("ItemName", System.Type.GetType("System.String"));
                objCartDT.Columns.Add("Cost", System.Type.GetType("System.Decimal"));
                objCartDT.Columns.Add("ImageURL", System.Type.GetType("System.String"));
                Session["Cart"] = objCartDT;
            }
        }
    }
    
    protected void btnFind_Click(object sender, EventArgs e)
    {
        string strSQL; 
        if(txtSearch.Text.Length == 0)
        {
            lblMessage.Text = "Please enter a keyword";
            return;
        }
        else
        {  //this could generate sql injection
           //should be replaced with a parameterized stored proc
            lblMessage.Text = "";
            if( chkDescription.Checked )
            {
                strSQL = "select * from EmployeeStore where ItemName like '%" +
                    txtSearch.Text + "%' or Description like '%" + txtSearch.Text + "%'";
            }
            else
            {
                strSQL = "select * from employeeStore where ItemName like '%" + 
                    txtSearch.Text + "%'";
            }
        }
       string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
        // Initialize connection
        objConn = new SqlConnection(connectionString);
        pnlShowCart.Visible = false;
        pnlShowItems.Visible = true;
        try
        {
            // Open the connection
            objConn.Open();
            SqlCommand subjectComm = new SqlCommand(
                strSQL, objConn);
            reader = subjectComm.ExecuteReader();
            dlItems.DataSource = reader;
            dlItems.DataBind();
            objConn.Close();
        }
        finally
        {
            // Close the connection
            objConn.Close();
        }
              
        lblSearchWord.Text = "&nbsp;with&nbsp;<i>'" + txtSearch.Text + "'</i>";

    }
    
    protected void dgCart_Edit(object source, DataGridCommandEventArgs e)
    {
        dgCart.EditItemIndex = e.Item.ItemIndex;

        dgCart.DataSource = objCartDT;
        dgCart.DataBind();
    }
    protected void dgCart_Cancel(object source, DataGridCommandEventArgs e)
    {
        dgCart.EditItemIndex = -1;

        dgCart.DataSource = objCartDT;
        dgCart.DataBind();
    }
    protected void dgCart_Update(object source, DataGridCommandEventArgs e)
    {
        TextBox txtQuantity;
        int intCartID;

        intCartID =  int.Parse(dgCart.DataKeys[e.Item.ItemIndex].ToString());
        txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");

        foreach (DataRow objDR in objCartDT.Rows)
        {
            if (int.Parse(objDR["CartID"].ToString()) == intCartID)
            {
                objDR["Quantity"] = Int32.Parse(txtQuantity.Text);
                break;
            }
        }

        lblTotal.Text = "$" + GetItemTotal();
        dgCart.EditItemIndex = -1;

        dgCart.DataSource = objCartDT;
        dgCart.DataBind();
    }
    protected void dgCart_Delete(object source, DataGridCommandEventArgs e)
    {
        objCartDT.Rows[e.Item.ItemIndex].Delete();

            dgCart.DataSource = objCartDT;
            dgCart.DataBind();

            lblTotal.Text = "$" + GetItemTotal();
    }
    protected void AddToCart(object source, DataListCommandEventArgs e)
    {
        pnlShowItems.Visible = false;
        pnlShowCart.Visible = true;
        objCartDT = (DataTable)Session["Cart"];

        int ItemID  = (int)dlItems.DataKeys[e.Item.ItemIndex];
        DataSet objItemInfo  = FindItem(ItemID);

        bool blnMatch = false;
        foreach(DataRow objDR in objCartDT.Rows)
        {
            if ((int)objDR["ItemID"] == ItemID) 
            {
                objDR["Quantity"] = (int)objDR["Quantity"] + 1;
                blnMatch = true;
                break;
          }
       }

         if (!blnMatch)
          {
            objDR = objCartDT.NewRow();
            objDR["ItemID"] = ItemID;//ItemId --> 0
            objDR["ItemName"] = (string)objItemInfo.Tables[0].Rows[0]["ItemName"];//ItemName --> 1
            objDR["Quantity"] = 1;//Quantity --> 2
            objDR["Cost"] = objItemInfo.Tables[0].Rows[0]["Cost"];//Cost --> 3
            objDR["ImageURL"] = objItemInfo.Tables[0].Rows[0]["ImageURL"];//ImageUrl --> 4
            objCartDT.Rows.Add(objDR);
        }

        dgCart.DataSource = objCartDT;
        dgCart.DataBind();

        lblTotal.Text = "$" + GetItemTotal();

    }
    protected decimal GetItemTotal()
    {
        decimal decRunningTotal = 0;

        foreach (DataRow objDR in objCartDT.Rows)
        {
            decRunningTotal += Decimal.Round((decimal)objDR["Cost"] * (int)objDR["Quantity"], 2);
        }

        return decRunningTotal;
    }
    //-----------googled Apr. 01 2011----------------------
    //authors.aspalliance.com/stevesmith/articles/convertReadertoSet.asp
    //---------------------------------------------------------------------
    ///    <summary>
    ///    Converts a SqlDataReader to a DataSet
    ///    <param name='reader'>
    /// SqlDataReader to convert.</param>
    ///    <returns>
    /// DataSet filled with the contents of the reader.</returns>
    ///    </summary>
    public static DataSet convertDataReaderToDataSet(SqlDataReader reader)
    {
        DataSet dataSet = new DataSet();
        do
        {
            // Create new data table

            DataTable schemaTable = reader.GetSchemaTable();
            DataTable dataTable = new DataTable();

            if (schemaTable != null)
            {
                // A query returning records was executed

                for (int i = 0; i < schemaTable.Rows.Count; i++)
                {
                    DataRow dataRow = schemaTable.Rows[i];
                    // Create a column name that is unique in the data table
                    string columnName = (string)dataRow["ColumnName"]; //+ "<C" + i + "/>";
                    // Add the column definition to the data table
                    DataColumn column = new DataColumn(columnName, (Type)dataRow["DataType"]);
                    dataTable.Columns.Add(column);
                }

                dataSet.Tables.Add(dataTable);

                // Fill the data table we just created

                while (reader.Read())
                {
                    DataRow dataRow = dataTable.NewRow();

                    for (int i = 0; i < reader.FieldCount; i++)
                        dataRow[i] = reader.GetValue(i);

                    dataTable.Rows.Add(dataRow);
                }
            }
            else
            {
                // No records were returned

                DataColumn column = new DataColumn("RowsAffected");
                dataTable.Columns.Add(column);
                dataSet.Tables.Add(dataTable);
                DataRow dataRow = dataTable.NewRow();
                dataRow[0] = reader.RecordsAffected;
                dataTable.Rows.Add(dataRow);
            }
        }
        while (reader.NextResult());
        return dataSet;
    }

    //-----------end od reader to dataset convertor----------------
    protected DataSet FindItem(int ItemID)
    {
        DataSet objItemInfo = new DataSet();
       
        string strSQL = "SELECT * FROM EmployeeStore WHERE ItemID=" + ItemID;
        SqlCommand subjectComm = new SqlCommand(strSQL, objConn);
        try
        {
            objConn.Open();
       
        reader = subjectComm.ExecuteReader();
    
        objItemInfo = convertDataReaderToDataSet(reader);
        }
        finally
        { objConn.Close(); }
        return objItemInfo;
    }


    protected void lbContinue_Click(object sender, EventArgs e)
    {
        pnlShowCart.Visible = false;
        pnlShowItems.Visible = true;
    }
    protected void lbCheckOut_Click(object sender, EventArgs e)
    {
        string cartBusiness = "sales@dorknozzle.com";
        string cartProduct;
        int cartQuantity;
        decimal cartCost;
        int itemNumber = 1;

        cartBusiness = Server.UrlEncode(cartBusiness);

        string strPayPal = "https://www.paypal.com/cgi-bin/webscr?cmd=_cart&upload=1";

        foreach (DataRow objDR in objCartDT.Rows)
        {
            cartProduct = Server.UrlEncode((string)objDR["ItemName"]);
            cartQuantity = (int)objDR["Quantity"];
            cartCost = (decimal)objDR["Cost"];

            strPayPal += "&item_name_" + itemNumber + "=" + cartProduct;
            strPayPal += "&amount_" + itemNumber + "=" + String.Format("{0:0.00} ", cartCost);
            strPayPal += "&quantity_" + itemNumber + "=" + cartQuantity;
            
            itemNumber += 1;
        }
        strPayPal += "&business=" + cartBusiness;   
        Response.Redirect(strPayPal);
  
    }
}
