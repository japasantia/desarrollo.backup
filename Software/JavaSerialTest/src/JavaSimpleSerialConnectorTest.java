import jssc.SerialPort;
import jssc.SerialPortException;

/**
 * Created by root on 13/07/17.
 */
public class JavaSimpleSerialConnectorTest
{
    public static void main(String[] args)
    {
        SerialPort serialPort = new SerialPort("/dev/ttyACM0");

        try
        {
            System.out.println("Port opened: " + serialPort.openPort());

            System.out.println("Reading from port: " + serialPort.readString());

            System.out.println("Params setted: " + serialPort.setParams(9600,
                    8, 1, 0));
            System.out.println("Successfully writen to port: " +
                serialPort.writeString("ca"));

            System.out.println("Reading from port: " + serialPort.readString());

            System.out.println("Port closed: " + serialPort.closePort());
        }
        catch (SerialPortException ex)
        {
            System.out.println(ex);
        }
    }
}
