/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package linkedlist;

/**
 *
 * @author phi
 */
public class DoubleLinkedList {
    protected class Node {
        Object value;
        Node prev;
        Node next;

        Node(Object value, Node prev, Node next) {
            this.value = value;
            this.prev = prev;
            this.next = next;
        }
    }

    protected Node head = null;
    protected Node tail = null;
    protected int size = 0;

    public boolean isEmpty() {
        return size == 0;
    }

    public int size() {
        return size;
    }

    public void addHead(Object value) {
        Node node = new Node(value, null, head);
        if (head != null)
            head.prev = node;
        else
            tail = node;
        head = node;
        size++;
    }

    public void addTail(Object value) {
        Node node = new Node(value, tail, null);
        if (tail != null)
            tail.next = node;
        else
            head = node;
        tail = node;
        size++;
    }

    public Object removeHead() throws EmptyListException {
        if (head == null) throw new EmptyListException();

        Node node = head;
        head = node.next;

        if (head != null)
            head.prev = null;
        else
            tail = null;

        size--;
        return node.value;
    }

    public Object removeTail() throws EmptyListException {
        if (tail == null) throw new EmptyListException();

        Node node = tail;
        tail = node.prev;

        if (tail != null)
            tail.next = null;
        else
            head = null;

        size--;
        return node.value;
    }

    public Object getHead() throws EmptyListException {
        if (head == null)
            throw new EmptyListException();
        else
            return head.value;
    }

    public Object getTail() throws EmptyListException {
        if (tail == null)
            throw new EmptyListException();
        else
            return tail.value;
    }
}
