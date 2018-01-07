import be.ac.ulb.gpib.GPIBDeviceIdentifier;
import be.ac.ulb.gpib.GPIBTest;

import java.util.Enumeration;

/**
 * Created by jarias on 06/09/17.
 */
public class JavaGpibTest
{
    public static void main(String[] args)
    {
        GPIBTest.main(args);

        Enumeration deviceList = GPIBDeviceIdentifier.getDevices();

        while (deviceList.hasMoreElements())
        {
            GPIBDeviceIdentifier deviceIdentifier =
                (GPIBDeviceIdentifier) deviceList.nextElement();
            System.out.printf("%s", deviceIdentifier.toString());
        }
    }

}
