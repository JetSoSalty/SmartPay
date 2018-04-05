using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace Custom_Server_Control
{
    [ToolboxBitmap(typeof(Calendar))]
    [ToolboxData("<{0}:CustomCalendar runat=server></{0}:CustomCalendar>")]
    public class CustomCalendar : CompositeControl
    {
        TextBox textBox;
        ImageButton imageButton;
        Calendar calendar;

        [Category("Appearance")]
        [Description("Sets the image icon for the calendar control")]
        public String ImageButtonImageUrl
        {
            get
            {
                EnsureChildControls();
                return imageButton.ImageUrl != null ? imageButton.ImageUrl : string.Empty;
            }
            set
            {
                EnsureChildControls();
                imageButton.ImageUrl = value;
            }
        }

        protected override void RecreateChildControls()
        {
            EnsureChildControls();
        }

        protected override void CreateChildControls()
        {
            Controls.Clear();

            textBox = new TextBox();
            textBox.ID = "dateTextBox";
            textBox.Width = Unit.Pixel(80);

            imageButton = new ImageButton();
            imageButton.ID = "calendarImageButton";
            imageButton.Click += new ImageClickEventHandler(imageButton_Click);

            calendar = new Calendar();
            calendar.ID = "calendarButton";
            calendar.Visible = false;
            calendar.SelectionChanged += new EventHandler(Calendar_SelectionChanged);

            //Add Child controls to CustomCalendar control
            this.Controls.Add(textBox);
            this.Controls.Add(imageButton);
            this.Controls.Add(calendar);
        }

        [Category("Appearance")]
        [Description("Gets or sets the selected date of custom calendar control")]
        public DateTime SelectedDate
        {
            get
            {
                EnsureChildControls();
                return string.IsNullOrEmpty(textBox.Text) ? DateTime.MinValue : Convert.ToDateTime(textBox.Text);
            }

            set
            {
                if(value != null)
                {
                    EnsureChildControls();
                    textBox.Text = value.ToShortDateString();
                    calendar.VisibleDate = value;
                }
                else
                {
                    EnsureChildControls();
                    textBox.Text = "";
                    calendar.VisibleDate = DateTime.Today;
                }
            }
        }

        private void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            textBox.Text = calendar.SelectedDate.ToShortDateString();
            DateSelectedEventArgs eventData = new DateSelectedEventArgs(calendar.SelectedDate);
            OnDateSelection(eventData);
            calendar.Visible = false;
        }

        private void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (calendar.Visible)
            {
                calendar.Visible = false;
            }
            else
            {
                calendar.Visible = true;
                if (string.IsNullOrEmpty(textBox.Text))
                {
                    calendar.VisibleDate = DateTime.Today;
                }
                else
                {
                    DateTime output = DateTime.Today;
                    bool isDateTimeConversionSuccessful = DateTime.TryParse(textBox.Text, out output);
                    calendar.VisibleDate = output;
                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            AddAttributesToRender(writer);
            writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding, "1");
            writer.RenderBeginTag(HtmlTextWriterTag.Table);
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);
            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            textBox.RenderControl(writer);
            writer.RenderEndTag();

            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            imageButton.RenderControl(writer);
            writer.RenderEndTag();

            writer.RenderEndTag();
            writer.RenderEndTag();

            calendar.RenderControl(writer);
        }

        public event DateSelectedEventHandler DateSelected;

        protected virtual void OnDateSelection(DateSelectedEventArgs e)
        {
            DateSelected?.Invoke(this, e);
        }
    }

    public class DateSelectedEventArgs : EventArgs
    {
        private DateTime _selectedDate;

        public DateSelectedEventArgs(DateTime selectedDate)
        {
            this._selectedDate = selectedDate;
        }

        public DateTime SelectedDate
        {
            get
            {
                return this._selectedDate;
            }
        }
    }

    public delegate void DateSelectedEventHandler(object sender, DateSelectedEventArgs e);

}
