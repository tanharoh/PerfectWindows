
ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    
    desktop := shellWindows.Item(ComObj(19, 8))
   
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"
        , "{000214E2-0000-0000-C000-000000000046}")
    {
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
           
            shell := ComObj(9,pdisp,1).Application
            shell.ShellExecute(prms*)
           
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}