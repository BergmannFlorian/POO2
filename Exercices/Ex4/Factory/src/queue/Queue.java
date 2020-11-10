/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package queue;

/**
 *
 * @author phi
 */
public interface Queue {
    // Returns wether the queue is empty (no items)
    public boolean isEmpty();

    // Returns the number of items in the queue
    public int size();

    // Puts a new item on the queue
    public void enqueue(Object value);

    // Remove the next item from the queue
    public Object dequeue() throws EmptyQueueException;
}
