using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.User
{
   public  class UserSceneryComment
   {
       private int _CommentID;
       private int _UserID;
       private string _CommentContent;
       //private DateTime _CommentTime;
       private string _CommentTime;
       private int _SceneryRate;
       private int _SceneryID;
       private int _State;
      
       //constructor
       public UserSceneryComment()
       { 
       }
       public UserSceneryComment(int UserID,string CommentContent,int SceneryRate,int SceneryID,int State )
       {
         //以下两个注释的属性在SQL数据库端进行自动插入更新
         // this._CommentID = CommentID;
           this._UserID = UserID;
           this._CommentContent = CommentContent;
         //  this._CommentTime = CommentTime;
           this._SceneryRate = SceneryRate;
           this._SceneryID = SceneryID;
           this._State = State;    
       }
       //put and set
    
       public int CommentID
       { 
           get { return _CommentID;}
           set { _CommentID = value;}
       }
       public int UserID
       {
           get { return _UserID; }
           set { _UserID = value; }
       }
      public string CommentContent
      {
          get { return _CommentContent; }
          set { _CommentContent = CommentContent; }
      }
       public  string CommentTime
        {
            get { return _CommentTime; }
            set { _CommentTime = CommentTime; }
        }
      public  int SceneryRate
       {
           get { return _SceneryRate; }
           set { _SceneryRate = SceneryRate; }
       }
      public  int SceneryID
        {
            get { return _SceneryID; }
            set { _SceneryID = SceneryID; }
        }
      public  int State
        {
            get { return _State; }
            set { _State = State; }
        }
   }

}
