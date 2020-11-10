/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package queue;

import java.util.ArrayList;

/**
 *
 * @author phi
 */
public class ArrayQueue implements Queue {
    protected ArrayList items;
    
    public ArrayQueue() {
        items = new ArrayList();
    }

    // Returns wether the queue is empty (no items)
    public boolean isEmpty() {
        return items.isEmpty();
    }

    // Returns the number of items in the queue
    public int size() {
        return items.size();
    }

    // Puts a new item on the queue
    public void enqueue(Object value) {
        items.add(value);
    }

    // Remove the next item from the queue
    public Object dequeue() {
        return items.remove(0);
    }
}
