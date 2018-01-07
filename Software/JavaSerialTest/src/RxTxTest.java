import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

import java.io.OutputStream;

/**
 * Created by root on 13/07/17.
 */
public class RxTxTest
{
    public static void main(String[] args)
    {
        try
        {
            CommPortIdentifier portIdentifier =
                    CommPortIdentifier.getPortIdentifier("/dev/ttyS20");
            CommPort commPort = portIdentifier.open("serial", 2000);
            SerialPort serialPort = (SerialPort) commPort;
            OutputStream out = serialPort.getOutputStream();

            out.write("cz".getBytes());

            out.close();
            serialPort.close();

        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
    }
}
