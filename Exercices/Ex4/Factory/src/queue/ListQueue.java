/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package queue;

import linkedlist.EmptyListException;

/**
 *
 * @author phi
 */
public class ListQueue implements Queue {
    protected linkedlist.DoubleLinkedList items;

    public ListQueue() {
        items = new linkedlist.DoubleLinkedList();
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
        items.addTail(value);
    }

    // Remove the next item from the queue
    public Object dequeue() throws EmptyQueueException {
        try {
            return items.removeHead();
        } catch (EmptyListException ex) {
            throw new EmptyQueueException();
        }
    }
}
