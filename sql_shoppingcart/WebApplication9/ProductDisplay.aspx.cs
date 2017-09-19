using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication9
{
    public partial class ProductDisplay : System.Web.UI.Page
    {
        Dictionary<string, float> cartItem;
        static SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString;
                    using (con = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand("Select * from ProductDisplay", con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet dt = new DataSet();
                        da.Fill(dt);
                        GridView1.DataSource = dt.Tables[0];
                        GridView1.DataBind();
                    }
                }
                catch(Exception exception)
                {
                    Response.Redirect("Error_Page.aspx");
                }
               
            }
        }

      
            protected void Gridview_row_Command(object sender, GridViewCommandEventArgs e)
            {
                if (e.CommandName == "AddToCart")
                {
                    int rowIndex = Int32.Parse((string)e.CommandArgument);
                    GridViewRow row = GridView1.Rows[rowIndex];
                    var pName = row.Cells[1].Text;
                    var cost = row.Cells[2].Text;
                    if (ViewState["cartItem"] == null)
                    {
                        cartItem = new Dictionary<string, float>();
                        cartItem[pName] = int.Parse(cost);
                        ViewState["cartItem"] = cartItem;
                        HttpContext.Current.Session["cartItem"] = cartItem;
                    }
                    else
                    {
                        cartItem = new Dictionary<string, float>();
                        cartItem = (Dictionary<string, float>)ViewState["cartItem"];
                        cartItem[pName] = int.Parse(cost);
                        HttpContext.Current.Session["cartItem"] = cartItem;
                    }
                }
            }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("My_Cart.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminControl.aspx");
        }
    }
}