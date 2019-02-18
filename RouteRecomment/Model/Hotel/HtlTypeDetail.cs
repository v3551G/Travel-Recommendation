using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Hotel
{
    public class HtlTypeDetail
    {
        public HtlTypeDetail()
        { 
        
        }
        private int vTypeID;
        public int TypeID
        {
            get { return this.vTypeID; }
            set { this.vTypeID = value; }
        }
        private String vHouseType;
        public String HouseType
        {
            get { return this.vHouseType; }
            set { this.vHouseType = value; }
        }

        private String vBedType;
        public String BedType
        {
            get { return this.vBedType; }
            set { this.vBedType = value; }
        }

        private String vHaveBreakfast;
        public String HaveBreakfast
        {
            get { return this.vHaveBreakfast; }
            set { this.vHaveBreakfast = value; }
        }

        private String vBroadband;
        public String Broadband
        {
            get { return this.vBroadband; }
            set { this.vBroadband = value; }
        }

        private String vPrice;
        public String Price
        {
            get { return this.vPrice; }
            set { this.vPrice = value; }
        }
    }
}
