var imgName;

function CheckNickName()
{
    var NickName = $get("NickName").value; //$get("txtUserName")其实是document.getElementById("txtUserName")
    imgName = "NickNameCheck"; 
    PageMethods.ChcekNickName(NickName,ShowResult);    
}

function CheckAccount()
{
   var UserAccount = $get("Account").value;
   imgName="CheckUserAccount";
   PageMethods.CheckUserAccount(UserAccount,ShowResult); 
}
function CheckEmail()
{
   var UserEmail = $get("Email").value;
   imgName="EmailCheck";
   PageMethods.CheckUserEmail(UserEmail,ShowResult); 
}

function CheckPassword()
{
    var PassWord = $get("PassWord").value;
    imgName = "CheckPassWord";
    PageMethods.ChcekPassWord(PassWord,ShowResult);    
}


function ShowResult(res)
{
    if(res == "Access")
        $get(imgName).innerHTML = "<img src=\"../images/image/CheckRight.gif\"alt=\"\"/>";
    else
        $get(imgName).innerHTML =  res;
}