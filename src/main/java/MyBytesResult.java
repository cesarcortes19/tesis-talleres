import com.cursos.action.util.ImageAction;
import com.opensymphony.xwork2.ActionInvocation;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;


/**
 * Created by Cesar on 30/09/2014.
 */
public class MyBytesResult implements Result {

    public void execute(ActionInvocation invocation) throws Exception {

        ImageAction action = (ImageAction) invocation.getAction();
        HttpServletResponse response = ServletActionContext.getResponse();

        response.setContentType(action.getCustomContentType());
        response.getOutputStream().write(action.getCustomImageInBytes());
        response.getOutputStream().flush();
    }

}