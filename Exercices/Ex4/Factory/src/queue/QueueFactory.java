/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package queue;

/**
 *
 * @author phi
 */
public class QueueFactory {
    public static Queue create(String name) throws ClassNotFoundException {
        if (name.compareTo("List") == 0) {
            return new ArrayQueue();
        }
        else if (name.compareTo("Array") == 0) {
            return new ListQueue();
        }
        else {
            throw new ClassNotFoundException();
        }
    }

}
