/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package linkedlist;

import java.util.NoSuchElementException;

/**
 *
 * @author phi
 */
public class IterableDoubleLinkedList extends DoubleLinkedList implements Iterable {
    public class Iterator implements java.util.Iterator<Object> {
        protected Node current;

        public Iterator(Node head) {
            current = head;
        }

        public boolean hasNext() {
            return current != null;
        }

        public Object next() {
            if (current == null)
                throw new NoSuchElementException();

            Object value = current.value;
            current = current.next;
            return value;
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
    
    public Iterator iterator() {
        return new Iterator(head);
    }
}
