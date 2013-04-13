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
using System.Net.Mail;

public partial class AdminNewsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void sendNewsletterButton_Click(
    object sender, EventArgs e)
    {
        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();
        // Try to send the message
        try
        {
            // Prepare two email addresses 
            MailAddress fromAddress = new MailAddress(
                "newsletter@dorknozzle.com", "Your Friends at Dorknozzle"
                );
            MailAddress toAddress = new MailAddress(toTextBox.Text);
            // Prepare the mail message
            message.From = fromAddress;
            message.To.Add(toAddress);
            message.Subject = subjectTextBox.Text;
            message.IsBodyHtml = true;
            message.Body =
                "<html><head><title>" +
                HttpUtility.HtmlEncode(subjectTextBox.Text) +
                "</title></head><body>" +
                "<img src=\"http://www.cristiandarie.ro/Dorknozzle" +
                "/Images/newsletter_header.gif\" />" +
                "<p>" +
                HttpUtility.HtmlEncode(introTextBox.Text) + "</p>" +
                "<p>Employee of the month: " +
                HttpUtility.HtmlEncode(employeeTextBox.Text) + "</p>" +
                "<p>This months featured event: " +
                HttpUtility.HtmlEncode(eventTextBox.Text) + "</p>" +
                "</body></html>";
            // Set server details
            //--------gmail relaying----------------
            smtpClient.UseDefaultCredentials = false; 
            smtpClient.Host = "smtp.gmail.com"; 
            smtpClient.Port = 587; 
            //replace your own gmail accound uid@gmail.com and pwd:
            smtpClient.Credentials = new System.Net.NetworkCredential("uid", "pwd"); 
            smtpClient.EnableSsl = true; 
            //------------------------------------------------
            //--------localhost relaying----------
            //smtpClient.Host = "localhost";
            //smtpClient.UseDefaultCredentials = true;
            //-------------------------------------------------
            // Send the email
            smtpClient.Send(message);
            // Inform the user
            resultLabel.Text = "Email sent!<br />";
        }
        catch (Exception ex)
        {
            // Display error message
            resultLabel.Text = "Couldn\'t send the message!";
        }
    }
}
