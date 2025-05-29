#!/bin/bash

# Simple address book script
ADDRESS_BOOK="contacts.txt"

# Function to add a contact
add_contact() {
    echo "Enter name:"
    read name
    echo "Enter phone:"
    read phone
    echo "Enter email:"
    read email
    echo "$name,$phone,$email" >> "$ADDRESS_BOOK"
    echo "Contact added!"
}

# Function to view contacts
view_contacts() {
    if [[ ! -f "$ADDRESS_BOOK" ]]; then
        echo "No contacts found!"
        return
    fi
    echo "Contacts:"
    cat "$ADDRESS_BOOK" | while IFS=',' read -r name phone email; do
        echo "Name: $name, Phone: $phone, Email: $email"
    done
}

# Main menu
while true; do
    echo "Address Book Menu:"
    echo "1. Add contact"
    echo "2. View contacts"
    echo "3. Exit"
    read -p "Choose an option (1-3): " choice

    case $choice in
        1) add_contact ;;
        2) view_contacts ;;
        3) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option!" ;;
    case
done
