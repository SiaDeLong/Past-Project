#include <iostream>
#include <sstream>
#include <stdlib.h>
#include <windows.h>
#include <cstdlib>
#include <string>

using namespace std;
stringstream ss; // used to convert from string to integer

struct Movie {

	int id;
	string title;
	string genre;
	string description;
	string voiceLanguage;
	string subtitleLanguage;
	string releaseDate;
	int minuteDuration;
	int ticketQuantity;
	float price;

	Movie* prev = NULL;
	Movie* next = NULL;

	~Movie() {

		cout << "Movie node deleted succesfully!";

	}

}*newMovie, * currentMovie;

class MovieLinkedList {

private:
	Movie* splitMovie(Movie* head) {

		Movie* fastNode = head, * slowNode = head;

		// fast node travel twice as fast as slow node to find the middle node of the linked list
		while (fastNode->next && fastNode->next->next)
		{
			fastNode = fastNode->next->next;
			slowNode = slowNode->next;
		}

		// pass data to another variable to avoid memory error
		Movie* secondHalf = slowNode->next;
		slowNode->next = NULL;

		return secondHalf;
	}
	Movie* mergeMovie(Movie* firstHalf, Movie* secondHalf) {

		// If first linked list is empty 
		if (!firstHalf)
			return secondHalf;

		// If second linked list is empty 
		if (!secondHalf)
			return firstHalf;

		// Smaller value will be put on the front
		if (sortMode == "Duration") {

			if (firstHalf->minuteDuration < secondHalf->minuteDuration)
			{
				firstHalf->next = mergeMovie(firstHalf->next, secondHalf);
				firstHalf->next->prev = firstHalf;
				firstHalf->prev = NULL;
				return firstHalf;
			}
			else
			{
				secondHalf->next = mergeMovie(firstHalf, secondHalf->next);
				secondHalf->next->prev = secondHalf;
				secondHalf->prev = NULL;
				return secondHalf;
			}
		}
		else if (sortMode == "Quantity") {

			if (firstHalf->ticketQuantity < secondHalf->ticketQuantity)
			{
				firstHalf->next = mergeMovie(firstHalf->next, secondHalf);
				firstHalf->next->prev = firstHalf;
				firstHalf->prev = NULL;
				return firstHalf;
			}
			else
			{
				secondHalf->next = mergeMovie(firstHalf, secondHalf->next);
				secondHalf->next->prev = secondHalf;
				secondHalf->prev = NULL;
				return secondHalf;
			}
		}
		else if (sortMode == "Price") {

			if (firstHalf->price < secondHalf->price)
			{
				firstHalf->next = mergeMovie(firstHalf->next, secondHalf);
				firstHalf->next->prev = firstHalf;
				firstHalf->prev = NULL;
				return firstHalf;
			}
			else
			{
				secondHalf->next = mergeMovie(firstHalf, secondHalf->next);
				secondHalf->next->prev = secondHalf;
				secondHalf->prev = NULL;
				return secondHalf;
			}
		}
	}

public:
	Movie* head, * tail;
	string sortMode, displayOrder;
	void addMovieToEnd() {

		// Scenario 1: At least one node in the linked list
		if (head != NULL) {

			// Assign the address
			tail->next = newMovie;
			newMovie->prev = tail;
			tail = newMovie;
		}
		// Scenario 2: The linked list is empty
		else {

			head = newMovie;
			tail = newMovie;
		}
	}
	void displayMovie() {

		// Read node by node from head or tail and cout the attributes
		if (displayOrder == "Asc") {

			currentMovie = head;
		}
		else if (displayOrder == "Desc") {

			currentMovie = tail;
		}
		while (currentMovie != NULL) {

			cout << "ID:\t\t\t" << currentMovie->id << endl
				<< "Title:\t\t\t" << currentMovie->title << endl
				<< "Genre:\t\t\t" << currentMovie->genre << endl
				<< "Description:\t\t" << currentMovie->description << endl
				<< "Voice Language:\t\t" << currentMovie->voiceLanguage << endl
				<< "Subtitle Language:\t" << currentMovie->subtitleLanguage << endl
				<< "Release Date:\t\t" << currentMovie->releaseDate << endl
				<< "Duration(minutes):\t" << currentMovie->minuteDuration << endl
				<< "Ticket Quantity:\t" << currentMovie->ticketQuantity << endl
				<< "Price:\t\t\t" << currentMovie->price << endl << endl;

			if (displayOrder == "Asc") {

				currentMovie = currentMovie->next;
			}
			else if (displayOrder == "Desc") {

				currentMovie = currentMovie->prev;
			}
		}
	}

	void displayMovieBasedOnGenre(int idToDisplay, string titleToDisplay, string genreToDisplay, string descriptionToDisplay,
		string voiceToDisplay, string subtitleToDisplay, string dateToDisplay, int durationToDisplay,
		int quantityToDisplay, float priceToDisplay) {
		// Display the searched genre result
		cout << "Genre:\t\t\t" << genreToDisplay << endl
			<< "ID:\t\t\t" << idToDisplay << endl
			<< "Title:\t\t\t" << titleToDisplay << endl
			<< "Description:\t\t" << descriptionToDisplay << endl
			<< "Voice Language:\t\t" << voiceToDisplay << endl
			<< "Subtitle Language:\t" << subtitleToDisplay << endl
			<< "Release Date:\t\t" << dateToDisplay << endl
			<< "Duration(minutes):\t" << durationToDisplay << endl
			<< "Ticket Quantity:\t" << quantityToDisplay << endl
			<< "Price:\t\t\t" << priceToDisplay << endl << endl;

	}

	void searchMovieById(int targetedId) {

		// Read node by node from head and cout the attributes for purchase detail if the id is equal to the targeted id
		currentMovie = head;
		while (currentMovie != NULL) {

			if (currentMovie->id == targetedId) {

				cout << "ID:\t\t\t" << currentMovie->id << endl

					<< "Title:\t\t\t" << currentMovie->title << endl
					<< "Price:\t" << currentMovie->price << endl << endl;
				break;
			}
			currentMovie = currentMovie->next;
		}
	}

	void searchMovieByTitle(string targetedTitle) {

		// Read node by node from head and cout the attributes if the title match the targeted title
		currentMovie = head;
		while (currentMovie != NULL) {

			if (currentMovie->title.find(targetedTitle) != string::npos) {

				cout << "ID:\t\t\t" << currentMovie->id << endl
					<< "Title:\t\t\t" << currentMovie->title << endl
					<< "Genre:\t\t\t" << currentMovie->genre << endl
					<< "Description:\t\t" << currentMovie->description << endl
					<< "Voice Language:\t\t" << currentMovie->voiceLanguage << endl
					<< "Subtitle Language:\t" << currentMovie->subtitleLanguage << endl
					<< "Release Date:\t\t" << currentMovie->releaseDate << endl
					<< "Duration(minutes):\t" << currentMovie->minuteDuration << endl
					<< "Ticket Quantity:\t" << currentMovie->ticketQuantity << endl
					<< "Price:\t\t\t" << currentMovie->price << endl << endl;
			}
			currentMovie = currentMovie->next;
		}
	}

	// Category filter
	void searchMovieBasedOnGenre(string targetedGenre) {
		currentMovie = head;
		bool existed = false;

		// If the list is not empty
		while (currentMovie != NULL) {

			// If the genre keyword inputted match with list
			if (currentMovie->genre.find(targetedGenre) != string::npos) {

				displayMovieBasedOnGenre(currentMovie->id,
					currentMovie->title,
					currentMovie->genre,
					currentMovie->description,
					currentMovie->voiceLanguage,
					currentMovie->subtitleLanguage,
					currentMovie->releaseDate,
					currentMovie->minuteDuration,
					currentMovie->ticketQuantity,
					currentMovie->price);
				existed = true;
			}
			currentMovie = currentMovie->next;
		}

		if (existed == false) {
			cout << "Movie with genre (" << targetedGenre << ") is not found!" << endl;
		}
	}
	// Update
	void updateMovieAttributes(int idToUpdate, string titleToUpdate, string genreToUpdate, string descriptionToUpdate,
		string voiceToUpdate, string subtitleToUpdate, string dateToUpdate, int durationToUpdate,
		int quantityToUpdate, float priceToUpdate) {
		// Get the user input and replace with the old data
		Movie* temp = head;
		idToUpdate = temp->id;
		titleToUpdate = temp->title;
		genreToUpdate = temp->genre;
		descriptionToUpdate = temp->description;
		voiceToUpdate = temp->voiceLanguage;
		subtitleToUpdate = temp->subtitleLanguage;
		dateToUpdate = temp->releaseDate;
		durationToUpdate = temp->minuteDuration;
		quantityToUpdate = temp->ticketQuantity;
		priceToUpdate = temp->price;
	}

	void updateMovieAtIndex(int targetedId) {
		currentMovie = head;
		bool existed = false;

		// If the list is not empty
		while (currentMovie != NULL) {

			// If the id match with one of the id in the list
			if (currentMovie->id == targetedId) {
				cout << "Update Movie with ID (" << targetedId << "): \n\n" << endl;

				cout << "ID:\t\t\t" << currentMovie->id << endl
					<< "Title:\t\t\t" << currentMovie->title << endl
					<< "Genre:\t\t\t" << currentMovie->genre << endl
					<< "Description:\t\t" << currentMovie->description << endl
					<< "Voice Language:\t\t" << currentMovie->voiceLanguage << endl
					<< "Subtitle Language:\t" << currentMovie->subtitleLanguage << endl
					<< "Release Date:\t\t" << currentMovie->releaseDate << endl
					<< "Duration(minutes):\t" << currentMovie->minuteDuration << endl
					<< "Ticket Quantity:\t" << currentMovie->ticketQuantity << endl
					<< "Price:\t\t\t" << currentMovie->price << endl << endl;

				// Read the new information to update
				cout << "Enter New Movie Title: ";
				cin >> currentMovie->title;
				cout << "Enter New Movie Genre: ";
				cin >> currentMovie->genre;
				cout << "Enter New Movie Description: ";
				cin >> currentMovie->description;
				cout << "Enter New Movie Voice Language: ";
				cin >> currentMovie->voiceLanguage;
				cout << "Enter New Movie Subtitle Language: ";
				cin >> currentMovie->subtitleLanguage;
				cout << "Enter New Movie Release Date: ";
				cin >> currentMovie->releaseDate;
				cout << "Enter New Movie Duration(minutes): ";
				cin >> currentMovie->minuteDuration;
				cout << "Enter New Movie Ticket Quantity: ";
				cin >> currentMovie->ticketQuantity;
				cout << "Enter New Movie Price: ";
				cin >> currentMovie->price;

				// Update the attributes of movie
				updateMovieAttributes(currentMovie->id,
					currentMovie->title,
					currentMovie->genre,
					currentMovie->description,
					currentMovie->voiceLanguage,
					currentMovie->subtitleLanguage,
					currentMovie->releaseDate,
					currentMovie->minuteDuration,
					currentMovie->ticketQuantity,
					currentMovie->price);

				existed = true;
			}
			currentMovie = currentMovie->next;
		}

		if (existed == false) {
			cout << "No Movie With Id (" << targetedId << ") is found. Please try again! " << endl;
		}
	}

	Movie* sortMovie(Movie* firstLinkedListhead) {

		if (!firstLinkedListhead || !firstLinkedListhead->next) {
			// if the linked list is too small that no need to sort
			return firstLinkedListhead;
		}

		// Split the linked list to small linked list
		Movie* secondLinkedListhead = splitMovie(firstLinkedListhead);

		// Recursive for first and second linked list 
		firstLinkedListhead = sortMovie(firstLinkedListhead);
		secondLinkedListhead = sortMovie(secondLinkedListhead);

		// Merge while sort the two linked list and return back to the called function 
		return mergeMovie(firstLinkedListhead, secondLinkedListhead);
	}
	// Delete
	void deleteMovieAtIndex(int targetedId) {

		// Cannot delete as list is empty
		if (head == NULL) {
			cout << "No movie available to be deleted" << endl;
			return;
		}
		else if (head->id == targetedId) {
			// Delete first node when list is not empty
			currentMovie = head;
			head = head->next;
			cout << "Movie with title (" << currentMovie->title << ") is deleted!" << endl;
			delete currentMovie;
		}
		else {
			// Delete the node in other location except first node
			currentMovie = head;
			Movie* prev = NULL;

			// If the list is not empty
			while (currentMovie != NULL) {
				if (currentMovie->id == targetedId) {
					prev->next = currentMovie->next;
					cout << "Movie with title (" << currentMovie->title << ") is deleted!" << endl;
					delete currentMovie;
					return;
				}
				prev = currentMovie;
				currentMovie = currentMovie->next;
			}
			cout << "Movie with id (" << targetedId << ") is not found!" << endl;
		}
	}
};
MovieLinkedList movieLinkedList;

struct Purchase {

	// Purchase attributes
	int id;
	int totalQuantity;

	string buyerName;
	string buyerContact;
	string datePurchased;
	string moviesPurchased;

	float price;

	Purchase* prev = NULL;
	Purchase* next = NULL;

	// destructor
	~Purchase() {

		cout << "Purchase node deleted succesfully!";

	}

}*newPurchase, * currentPurchase, * nextPurchase; // new - for new nodes, current - for node traversal, next - for insertion sort

class PurchaseLinkedList {

public:
	Purchase* head, * tail;

	void addPurchaseToFront() {

		// set current head address to the next address of the new node
		newPurchase->next = head;
		newPurchase->prev = NULL;
		// update head to new node
		head = newPurchase;
		// if tail is empty
		if (tail == NULL) {
			tail = newPurchase;
		}
		else {
			// link the next address to new node
			newPurchase->next->prev = newPurchase;
		}
	}

	void displayPurchase() {

		currentPurchase = head;

		// if current is not NULL, then display node attributes
		while (currentPurchase != NULL) {

			cout << "ID:\t\t\t" << currentPurchase->id << endl
				<< "Customer Name:\t\t\t" << currentPurchase->buyerName << endl
				<< "Customer Contact:\t\t\t" << currentPurchase->buyerContact << endl
				<< "Date Purchased:\t\t" << currentPurchase->datePurchased << endl
				<< "Total Quantity:\t\t" << currentPurchase->totalQuantity << endl
				<< "Total Price:\t" << currentPurchase->price << endl << endl;

			// traverse to next node
			currentPurchase = currentPurchase->next;
		}
	};

	void sortedInsert() {

		// sort in ascending order
		// set node of unsorted list to new node
		newPurchase = currentPurchase;

		// if sorted list is empty
		if (head == NULL) {
			head = newPurchase;
		}
		// if price of new node is smaller than head, place new node infront of head
		else if (head->price >= newPurchase->price) {
			newPurchase->next = head;
			newPurchase->next->prev = newPurchase;
			head = newPurchase;
		}
		// if price of new node is more than price of head
		else {
			// set current node to head of sorted list
			currentPurchase = head;

			// while the next node is not NULL and
			// price of new node is greater than price of the node next to current
			while (currentPurchase->next != NULL && currentPurchase->next->price < newPurchase->price) {
				// go to next node
				currentPurchase = currentPurchase->next;
			}

			// after node has traversed to a node that it is larger than
			// set the next address of new node to the next address of the current node
			newPurchase->next = currentPurchase->next;

			// if node reached end of list
			if (currentPurchase->next != NULL) {
				newPurchase->next->prev = newPurchase;
			}

			currentPurchase->next = newPurchase;
			newPurchase->prev = currentPurchase;

		}

	};
	void insertionSortPurchase(Purchase* unsorted) {

		currentPurchase = unsorted;
		while (currentPurchase != NULL) {

			nextPurchase = currentPurchase->next;
			currentPurchase->prev = NULL;
			currentPurchase->next = NULL;
			sortedInsert();
			currentPurchase = nextPurchase;

		}

	};
	void displayPurchaseDetail(int searchId) {

		currentPurchase = head;
		int intId;

		do {
			// traverse until id input by the user is found
			if (currentPurchase->id != searchId) {
				currentPurchase = currentPurchase->next;
			}
			else {

				string movieIds = currentPurchase->moviesPurchased;
				string id = "";

				// loop through string until delimiter is found
				for (auto x : movieIds) {
					if (x == ';') {
						// convert id of type string to int for insertion to node
						ss << id;
						ss >> intId;
						movieLinkedList.searchMovieById(intId);
					}
					else {
						// if current iteration is not a delimiter, concatenate string
						id = id + x;
					}
				}

			}
		} while (currentPurchase != NULL);

	};
};
PurchaseLinkedList purchaseLinkedList, sortedPurchaseLinkedList;

void printCenter(string text) {

	// Print the text in center
	int textLength = text.length();
	int oddOrEven = text.length() % 2;
	if (oddOrEven == 0) {
		cout << "|" << string(((59 - text.length()) / 2), ' ') << text << string(((58 - text.length()) / 2), ' ') << "|" << endl;
	}
	else {
		cout << "|" << string(((58 - textLength) / 2), ' ') << text << string(((59 - textLength) / 2), ' ') << "|" << endl;
	}
}

void printMenuOptions(string text) {

	// Print the options of each menu in a structured way
	int textLength = text.length();
	int oddOrEven = text.length() % 2;
	if (oddOrEven == 0) {
		cout << "|" << string(20, ' ') << text << string(((38 - textLength)), ' ') << "|" << endl;
	}
	else {
		cout << "|" << string(20, ' ') << text << string(((38 - textLength)), ' ') << "|" << endl;
	}
}

void drawLine() {

	// Draw line for the menu box
	cout << string(60, '=') << endl;
}

void emptySpace() {

	// Format for menu box
	cout << "|" << string(58, ' ') << "|" << endl;
}

void mainMenu() {

	// Declare the variables for main menu
	string mainMenu = "Main Menu";
	string optionM1 = "1 --> Movie Inventory";
	string optionM2 = "2 --> Transaction";
	string optionM3 = "3 --> Exit";

	// Display the main menu by calling those functions
	drawLine();
	emptySpace();
	printCenter(mainMenu);
	emptySpace();
	drawLine();
	emptySpace();
	printMenuOptions(optionM1);
	printMenuOptions(optionM2);
	printMenuOptions(optionM3);
	emptySpace();
	drawLine();
	cout << endl;
}

void movieInventoryMenu() {

	// Declare the variables for movie inventory menu
	string movieInventoryMenu = "Movie Inventory Menu";
	string optionI1 = "1 --> Add Movie";
	string optionI2 = "2 --> Display Movie";
	string optionI3 = "3 --> Search Movie";
	string optionI4 = "4 --> Category Filter";
	string optionI5 = "5 --> Update Movie";
	string optionI6 = "6 --> Sort Movie";
	string optionI7 = "7 --> Delete Movie";
	string optionI8 = "8 --> Back";
	string optionI9 = "9 --> Exit";

	// Display the movie inventory menu by calling those functions
	drawLine();
	emptySpace();
	printCenter(movieInventoryMenu);
	emptySpace();
	drawLine();
	emptySpace();
	printMenuOptions(optionI1);
	printMenuOptions(optionI2);
	printMenuOptions(optionI3);
	printMenuOptions(optionI4);
	printMenuOptions(optionI5);
	printMenuOptions(optionI6);
	printMenuOptions(optionI7);
	printMenuOptions(optionI8);
	printMenuOptions(optionI9);
	emptySpace();
	drawLine();
	cout << endl;
}

void transactionMenu() {

	// Declare the variables for transaction menu
	string transactionMenu = "Transaction Menu";
	string optionT1 = "1 --> Add Purchase";
	string optionT2 = "2 --> View Purchase";
	string optionT3 = "3 --> Sort Purchase";
	string optionT4 = "4 --> Purchase Details";
	string optionT5 = "5 --> Back";
	string optionT6 = "6 --> Exit";

	// Display the movie inventory menu by calling those functions
	drawLine();
	emptySpace();
	printCenter(transactionMenu);
	emptySpace();
	drawLine();
	emptySpace();
	printMenuOptions(optionT1);
	printMenuOptions(optionT2);
	printMenuOptions(optionT3);
	printMenuOptions(optionT4);
	printMenuOptions(optionT5);
	printMenuOptions(optionT6);
	emptySpace();
	drawLine();
	cout << endl;
}

void exitSystem() {

	// Quit the system
	exit(0);
}

void clearScreen() {

	// Pause the system
	system("PAUSE");

	// Clear screen
	system("cls");
}

void wait() {
	cout << "Exit the system" << endl;

	// Pause the system
	system("PAUSE");

	// Clear screen
	system("cls");
}

void invalid() {

	// Print invalid message
	cout << "Invalid input. Please enter again." << endl;
}

void predefinedRecords() {

	// Hard-codded dummy data
	// Movie data
	newMovie = new Movie;
	newMovie->id = 1;
	newMovie->title = "Apple";
	newMovie->genre = "Drama";
	newMovie->description = "This is a movie about apple";
	newMovie->voiceLanguage = "English";
	newMovie->subtitleLanguage = "Malay";
	newMovie->releaseDate = "1/2/2022";
	newMovie->minuteDuration = 120;
	newMovie->ticketQuantity = 250;
	newMovie->price = 15.00;
	movieLinkedList.addMovieToEnd();

	newMovie = new Movie;
	newMovie->id = 2;
	newMovie->title = "Boy";
	newMovie->genre = "Adventure";
	newMovie->description = "This is a movie about boy";
	newMovie->voiceLanguage = "Mandarin";
	newMovie->subtitleLanguage = "Malay";
	newMovie->releaseDate = "7/2/2022";
	newMovie->minuteDuration = 124;
	newMovie->ticketQuantity = 150;
	newMovie->price = 20.00;
	movieLinkedList.addMovieToEnd();

	newMovie = new Movie;
	newMovie->id = 3;
	newMovie->title = "Cat";
	newMovie->genre = "Action";
	newMovie->description = "This is a movie about cat";
	newMovie->voiceLanguage = "Malay";
	newMovie->subtitleLanguage = "English";
	newMovie->releaseDate = "5/2/2022";
	newMovie->minuteDuration = 157;
	newMovie->ticketQuantity = 100;
	newMovie->price = 35.00;
	movieLinkedList.addMovieToEnd();

	newMovie = new Movie;
	newMovie->id = 4;
	newMovie->title = "Donkey";
	newMovie->genre = "Drama";
	newMovie->description = "This is a movie about donkey";
	newMovie->voiceLanguage = "Malay";
	newMovie->subtitleLanguage = "English";
	newMovie->releaseDate = "16/2/2022";
	newMovie->minuteDuration = 136;
	newMovie->ticketQuantity = 50;
	newMovie->price = 12.00;
	movieLinkedList.addMovieToEnd();

	newMovie = new Movie;
	newMovie->id = 5;
	newMovie->title = "Apple2";
	newMovie->genre = "Drama";
	newMovie->description = "This is a movie about apple";
	newMovie->voiceLanguage = "English";
	newMovie->subtitleLanguage = "Malay";
	newMovie->releaseDate = "19/2/2022";
	newMovie->minuteDuration = 140;
	newMovie->ticketQuantity = 270;
	newMovie->price = 20.00;
	movieLinkedList.addMovieToEnd();

	// Purchase data
	newPurchase = new Purchase;
	newPurchase->id = 1;
	newPurchase->totalQuantity = 5;
	newPurchase->buyerName = "Thian Shan You";
	newPurchase->buyerContact = "0122095199";
	newPurchase->datePurchased = "20/02/2022";
	newPurchase->moviesPurchased = "1;2;3;4;5;";
	newPurchase->price = 102;
	purchaseLinkedList.addPurchaseToFront();

	newPurchase = new Purchase;
	newPurchase->id = 2;
	newPurchase->totalQuantity = 2;
	newPurchase->buyerName = "Beh Chi Hao";
	newPurchase->buyerContact = "0122094239";
	newPurchase->datePurchased = "21/02/2022";
	newPurchase->moviesPurchased = "1;2";
	newPurchase->price = 35;
	purchaseLinkedList.addPurchaseToFront();

	newPurchase = new Purchase;
	newPurchase->id = 3;
	newPurchase->totalQuantity = 3;
	newPurchase->buyerName = "Sia De Long";
	newPurchase->buyerContact = "0122654199";
	newPurchase->datePurchased = "22/02/2022";
	newPurchase->moviesPurchased = "1;2;3;";
	newPurchase->price = 70;
	purchaseLinkedList.addPurchaseToFront();

	newPurchase = new Purchase;
	newPurchase->id = 4;
	newPurchase->totalQuantity = 4;
	newPurchase->buyerName = "Thian Shan You";
	newPurchase->buyerContact = "0135094199";
	newPurchase->datePurchased = "23/02/2022";
	newPurchase->moviesPurchased = "1;2;3;4;";
	newPurchase->price = 82;
	purchaseLinkedList.addPurchaseToFront();

	newPurchase = new Purchase;
	newPurchase->id = 5;
	newPurchase->totalQuantity = 1;
	newPurchase->buyerName = "Thian Shan You";
	newPurchase->buyerContact = "0122774199";
	newPurchase->datePurchased = "24/02/2022";
	newPurchase->moviesPurchased = "1;";
	newPurchase->price = 15;
	purchaseLinkedList.addPurchaseToFront();

}

int main() {

	// Call the predefined data
	predefinedRecords();

	int option = 0;
	int intId = 0;
	string targetedId;
	string targetedTitle;
	string targetedGenre;
	string decision;

	// Main menu
mainMenu:
	mainMenu();

	// Prompt user to enter the option
	cout << "Enter option:" << endl;
	cin >> option;
	clearScreen();

	do {
		switch (option)
		{
		case 1:
			// Redirect to movie inventory menu
			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 2:
			// Redirect to transaction menu
			transactionMenu();
			goto transactionMenu;
			break;
		case 3:
			// Quit the system
			exitSystem();
			break;
		default:
			// Invalid options
			invalid();
			break;
		}
	} while (option < 1 && option > 3);

movieInventoryMenu:
	do {
		int option = 0;
		cout << "Enter option:" << endl;
		cin >> option;
		clearScreen();
		switch (option)
		{
		case 1:

			movieLinkedList.displayMovie();

			do {

				// Read new movie data
				newMovie = new Movie;
				cout << "Enter Movie ID: ";
				cin >> newMovie->id;
				cout << "Enter Movie Title: ";
				cin.ignore();
				getline(cin, newMovie->title);
				cout << "Enter Movie Genre: ";
				getline(cin, newMovie->genre);
				cout << "Enter Movie Description: ";
				getline(cin, newMovie->description);
				cout << "Enter Movie Voice Language: ";
				getline(cin, newMovie->voiceLanguage);
				cout << "Enter Movie Subtitle Language: ";
				getline(cin, newMovie->subtitleLanguage);
				cout << "Enter Movie Release Date: ";
				getline(cin, newMovie->releaseDate);
				cout << "Enter Movie Duration(minutes): ";
				cin >> newMovie->minuteDuration;
				cout << "Enter Movie Ticket Quantity: ";
				cin >> newMovie->ticketQuantity;
				cout << "Enter Movie Price: ";
				cin >> newMovie->price;

				// Add new movie to the end
				movieLinkedList.addMovieToEnd();

				cout << "Do you want to insert another movie? (Y/N): ";
				cin >> decision;
				system("cls");
			} while (decision == "y" || decision == "Y");

			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 2:

			cout << "Display Order" << endl;
			cout << "1 --> Ascending" << endl;
			cout << "2 --> Descending" << endl;

			cout << "Enter Display Order: ";
			cin >> option;

			do {
				switch (option) {

				case 1: movieLinkedList.displayOrder = "Asc"; break;
				case 2: movieLinkedList.displayOrder = "Desc"; break;
				default: invalid(); break;
				}
			} while (option < 1 && option > 3);

			// Display all movie in the linked list
			movieLinkedList.displayMovie();

			clearScreen();
			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 3:

			do {

				// Get targeted title
				cout << "Enter Targeted Movie Title: ";
				cin >> targetedTitle;

				// Search from linked list to find matching title and display them
				movieLinkedList.searchMovieByTitle(targetedTitle);

				cout << "Do you want to search for another movie? (Y/N): ";
				cin >> decision;
				system("cls");
			} while (decision == "y" || decision == "Y");

			system("cls");
			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 4:
			// Get targeted genre
			do {

				// Get targeted title
				cout << "Enter Targeted Movie Genre: ";
				cin >> targetedGenre;

				// Search from linked list to find matching title and display them
				movieLinkedList.searchMovieBasedOnGenre(targetedGenre);

				cout << "Do you want to search for another genre? (Y/N): ";
				cin >> decision;
				system("cls");
			} while (decision == "y" || decision == "Y");

			system("cls");
			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 5:
			// Update movie attributes based on movie id
			do {

				// Display available movie list
				cout << "Available movie: \n\n " << endl;
				movieLinkedList.displayMovie();

				// Get targeted title
				cout << "Enter Targeted Movie Id: ";
				cin >> targetedId;
				clearScreen();
				ss << targetedId;
				ss >> intId;
				// Search from linked list to find matching title and display them
				movieLinkedList.updateMovieAtIndex(intId);

				cout << "Do you want to update another movie? (Y/N): ";
				cin >> decision;
				system("cls");
			} while (decision == "y" || decision == "Y");

			system("cls");
			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 6:

			cout << "Sort Movie" << endl;
			cout << "1 --> Sort By Duration" << endl;
			cout << "2 --> Sort By Quantity" << endl;
			cout << "3 --> Sort By Price" << endl;

			cout << "Enter Sort Mode: ";
			cin >> option;

			do {
				switch (option) {

				case 1: movieLinkedList.sortMode = "Duration"; break;
				case 2: movieLinkedList.sortMode = "Quantity"; break;
				case 3: movieLinkedList.sortMode = "Price"; break;
				default: invalid(); break;
				}
			} while (option < 1 && option > 3);

			// Sort movie by ticket quantity
			movieLinkedList.head = movieLinkedList.sortMovie(movieLinkedList.head);
			cout << "Linked List Sorted!" << endl;
			clearScreen();

			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 7:
			// Delete movie at index
			do {

				// Display available movie list
				cout << "Available movies: \n\n " << endl;
				movieLinkedList.displayMovie();

				// Get targeted id
				cout << "Enter Targeted Movie Id To Be Deleted: ";
				cin >> targetedId;
				ss << targetedId;
				ss >> intId;
				movieLinkedList.deleteMovieAtIndex(intId);
				cout << "Do you want to delete another movie? (Y/N): ";
				cin >> decision;
				clearScreen();

			} while (decision == "y" || decision == "Y");

			movieInventoryMenu();
			goto movieInventoryMenu;
			break;
		case 8:
			// Back to main menu
			goto mainMenu;
			break;
		case 9:
			// Quit the system
			exitSystem();
			break;
		default:
			// Invalid options selected
			invalid();
			break;
		}
	} while (option < 1 && option > 9);

transactionMenu:
	do {
		int option = 0;
		cout << "Enter option:" << endl;
		cin >> option;
		clearScreen();
		switch (option)
		{
		case 1:

			do {

				// Input new Purchase data
				newPurchase = new Purchase;
				newPurchase->id = purchaseLinkedList.head->id + 1;
				cin.ignore();
				cout << "Enter Buyer Name: ";
				getline(cin, newPurchase->buyerName);
				cout << "Enter Buyer Contact: ";
				getline(cin, newPurchase->buyerContact);
				cout << "Enter Purchase Date (DD/MM/YYYY): ";
				getline(cin, newPurchase->datePurchased);

				cout << "Available movies: \n\n " << endl;
				movieLinkedList.displayMovie();
				string movieIds = "";
				string movieId = "";
				int count = 0;
				newPurchase->price = 0;

				// loop to allow user to enter multiple movies
				do {

					cout << "Enter Movie Id : ";
					cin.ignore();
					getline(cin, movieId);

					// convert id from string to integer
					movieIds = movieIds + movieId + ";";
					ss << movieId;
					ss >> intId;

					// traverse movie linked list
					currentMovie = movieLinkedList.head;
					while (currentMovie != NULL) {
						// if found, add price to purchase total price, decrement ticket quantity by 1
						if (currentMovie->id == intId) {

							newPurchase->price += currentMovie->price;
							currentMovie->ticketQuantity -= 1;
							break;
						}
						currentMovie = currentMovie->next;
					}

					// count for total quantity
					count++;

					cout << "Do you want to insert another movie? (Y/N): ";
					cin >> decision;
				} while (decision == "y" || decision == "Y");
				newPurchase->moviesPurchased = movieIds;
				newPurchase->totalQuantity = count;

				// Add new purchase to linked list
				purchaseLinkedList.addPurchaseToFront();

				cout << "Do you want to insert another purchase? (Y/N): ";
				cin >> decision;
				cin.ignore();
				system("cls");
			} while (decision == "y" || decision == "Y");

			clearScreen();
			transactionMenu();
			goto transactionMenu;
			break;
		case 2:
			purchaseLinkedList.displayPurchase();
			clearScreen();
			transactionMenu();
			goto transactionMenu;
			break;
		case 3:
			// created sorted linked list object, insert head node of unsorted linked list
			sortedPurchaseLinkedList.insertionSortPurchase(purchaseLinkedList.head);
			sortedPurchaseLinkedList.displayPurchase();
			clearScreen();
			transactionMenu();
			goto transactionMenu;
			break;
		case 4:
			// display purchase list for user to see purchases available to view
			purchaseLinkedList.displayPurchase();
			int purchaseId;
			cin.ignore();
			cout << "Enter Purchase ID: ";
			cin >> purchaseId;
			purchaseLinkedList.displayPurchaseDetail(purchaseId);

			clearScreen();
			transactionMenu();
			goto transactionMenu;
			break;
		case 5:
			// Back to main menu
			goto mainMenu;
			break;
		case 6:
			// Quit the system
			exitSystem();
			break;
		default:
			// Invalid option selected
			invalid();
			break;
		}
	} while (option < 1 && option > 6);

	return 0;
}