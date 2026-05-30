#include <iostream>
#include <string>
#include <sstream> 
#include <iomanip>
#include <windows.h>
#include <set>
#include <cctype>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <algorithm>
#include <numeric>
#include <regex>
#include <conio.h>
using namespace std;

void staffLogin();
void menuList(int &selection);
void setcolor(unsigned char color) {
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
}
void calculatePayment(int& total, string& nums, string &token);
void payment_Method(int& paymentMethod, int &total, int& amountCash);
void receipt(string& nums, int& totalPrice, int& paymentMethod, int& amountCash);
void ticket(string& nums, string &token);
void salesReport(vector<int>& data);

int main()
{
    int selection;
    int ar_V[61] = { 0 };
    int ar_C[81] = { 0 };
    int ar_N[81] = { 0 };
    string ar_valid_seats[220] = {
        "V01", "V02", "V03", "V04", "V05",     "V06", "V07", "V08", "V09", "V10", "V11", "V12", "V13", "V14", "V15",     "V16", "V17", "V18", "V19", "V20",
        "V21", "V22", "V23", "V24", "V25",     "V26", "V27", "V28", "V29", "V30", "V31", "V32", "V33", "V34", "V35",     "V36", "V37", "V38", "V39", "V40",
        "V41", "V42", "V43", "V44", "V45",     "V46", "V47", "V48", "V49", "V50", "V51", "V52", "V53", "V54", "V55",     "V56", "V57", "V58", "V59", "V60",
        "C01", "C02", "C03", "C04", "C05",     "C06", "C07", "C08", "C09", "C10", "C11", "C12", "C13", "C14", "C15",     "C16", "C17", "C18", "C19", "C20",
        "C21", "C22", "C23", "C24", "C25",     "C26", "C27", "C28", "C29", "C30", "C31", "C32", "C33", "C34", "C35",     "C36", "C37", "C38", "C39", "C40",
        "C41", "C42", "C43", "C44", "C45",     "C46", "C47", "C48", "C49", "C50", "C51", "C52", "C53", "C54", "C55",     "C56", "C57", "C58", "C59", "C60",
        "C61", "C62", "C63", "C64", "C65",     "C66", "C67", "C68", "C69", "C70", "C71", "C72", "C73", "C74", "C75",     "C76", "C77", "C78", "C79", "C80",
        "N01", "N02", "N03", "N04", "N05",     "N06", "N07", "N08", "N09", "N10", "N11", "N12", "N13", "N14", "N15",     "N16", "N17", "N18", "N19", "N20",
        "N21", "N22", "N23", "N24", "N25",     "N26", "N27", "N28", "N29", "N30", "N31", "N32", "N33", "N34", "N35",     "N36", "N37", "N38", "N39", "N40",
        "N41", "N42", "N43", "N44", "N45",     "N46", "N47", "N48", "N49", "N50", "N51", "N52", "N53", "N54", "N55",     "N56", "N57", "N58", "N59", "N60",
        "N61", "N62", "N63", "N64", "N65",     "N66", "N67", "N68", "N69", "N70", "N71", "N72", "N73", "N74", "N75",     "N76", "N77", "N78", "N79", "N80",
    };
    vector<int> data = { 0, 0, 0 };
    staffLogin();
    for (int a = 0; a < 500; a++)
    {
        do
        {
            string nums, num, token;
            int quantity, i, j, k, seatIndex, seatIndex1, seatIndex2, seatCount, total, paymentMethod, amountCash;
            char zone, yesNo;
            menuList(selection);

            switch (selection)
            {
            case 1:
                system("cls");
                cout << setw(141) << " ,-----. ,-----.  ,-----. ,--.       ,------. ,--.     ,---.,--.   ,--.     ,-----. ,-----. ,--.  ,--. ,-----.,------.,------. ,--------. " << endl;
                cout << setw(141) << "'  .--./'  .-.  ''  .-.  '|  |       |  .--. '|  |    /  O  \\\\  `.'  /     '  .--./'  .-.  '|  ,'.|  |'  .--./|  .---'|  .--. ''--.  .--' " << endl;
                cout << setw(141) << "|  |    |  | |  ||  | |  ||  |       |  '--' ||  |   |  .-.  |'.    /      |  |    |  | |  ||  |' '  ||  |    |  `--, |  '--'.'   |  |    " << endl;
                cout << setw(141) << "'  '--'\\'  '-'  ''  '-'  '|  '--.    |  | --' |  '--.|  | |  |  |  |       '  '--'\\'  '-'  '|  | `   |'  '--'\\|  `---.|  |\\  \\    |  |    " << endl;
                cout << setw(141) << " `-----' `-----'  `-----' `-----'    `--'     -----'--' `--'  `--'        `-----' `-----' `--'  `--' -----'------'`--' '--'   `--'    " << endl;
                cout << setw(60) << "VENUE: STADIUM BUKIT JALIL" << setw(32) << "DATE: SATURDAY APRIL 6, 2024" << setw(16) << "TIME: 6.00PM" << endl;
                cout << endl << endl;
                cout << setw(44) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << endl;
                cout << "\n" << setw(24) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(56) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << endl;
                cout << "\n" << setw(24) << "*" << setw(20) << "*" << setw(30) << "STAGE" << setw(26) << "*" << setw(20) << "*" << endl;
                cout << "\n" << setw(24) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(56) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << endl;
                cout << "\n" << setw(44) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << setw(4) << "*" << endl;
                cout << "\n" << endl;

                setcolor(0x04);
                cout << "\t";
                for (i = 1; i < 61; i++)
                {
                    zone = 'V';
                    if (ar_V[i] == 1) {
                        cout << "[" << " X " << "]";
                    }
                    else {
                        if (i < 10) {
                            cout << "[" << zone << "0" << i << "]";
                        }
                        else {
                            cout << "[" << zone << i << "]";
                        }
                    }
                    if (i % 20 == 0) {
                        cout << "\n\t";
                    }
                    else if (i % 5 == 0 && i % 10 != 0)
                    {
                        cout << setw(5) << " ";
                    }
                    else
                    {
                        cout << " ";
                    }

                }

                setcolor(0x01);
                for (j = 1; j < 81; j++)
                {
                    zone = 'C';
                    if (ar_C[j] == 1)
                    {
                        cout << "[" << " X " << "]";
                    }
                    else {
                        if (j < 10) {
                            cout << "[" << zone << "0" << j << "]";
                        }
                        else {
                            cout << "[" << zone << j << "]";
                        }
                    }
                    if (j % 20 == 0) {
                        cout << "\n\t";
                    }

                    else if (j % 5 == 0 && j % 10 != 0) {
                        cout << setw(5) << " ";
                    }
                    else
                    {
                        cout << " ";
                    }
                }
                setcolor(0x0E);
                for (k = 1; k < 81; k++)
                {
                    zone = 'N';
                    if (ar_N[k] == 1)
                    {
                        cout << "[" << " X " << "]";
                    }
                    else {
                        if (k < 10) {
                            cout << "[" << zone << "0" << k << "]";
                        }
                        else {
                            cout << "[" << zone << k << "]";
                        }
                    }
                    if (k % 20 == 0) {
                        cout << "\n\t";
                    }

                    else if (k % 5 == 0 && k % 10 != 0) {
                        cout << setw(5) << " ";
                    }
                    else
                    {
                        cout << " ";
                    }
                }
                cout << endl;
                setcolor(0x04);
                cout << setw(57) << "VIP ZONE  RM890";
                setcolor(0x00);
                cout << "  |  ";
                setcolor(0x01);
                cout << "CAT ZONE  RM450";
                setcolor(0x00);
                cout << "  |  ";
                setcolor(0x0E);
                cout << "NORMAL ZONE  RM280" << endl;
                setcolor(0x00);
                cout << setw(136) << "---------------------------------------------------------------------------------------------------------------------------------" << endl;
                do
                {
                    cout << "\tEnter the quantity of ticket(s) : ";
                    cin >> quantity;
                    if (quantity <= 0 || quantity > 6 || cin.fail())
                    {
                        cerr << "\tInvalid quantity entered.\n" << endl;
                        cin.clear();
                        cin.ignore(1000, '\n');
                    }
                } while (quantity <= 0 || quantity > 6);

                cin.ignore();
                do
                {
                    cout << "\tEnter seat number(s) separated by space : ";
                    getline(cin, nums);
                    istringstream iss(nums);
                    istringstream count_iss(nums);
                    int numOfSeatsEntered = 0;
                    bool valid_seats = true;
                    while (count_iss >> token && valid_seats == true)
                    {
                        valid_seats = false;
                        numOfSeatsEntered += 1;
                        for (string i : ar_valid_seats)
                        {
                            if (token == i)
                            {
                                valid_seats = true;
                                break;
                            }
                        }
                    }
                    seatCount = 0;
                    while (iss >> num && seatCount < quantity && numOfSeatsEntered == quantity && valid_seats == true)
                    {
                        zone = num[0];
                        seatIndex = stoi(num.substr(1));
                        seatIndex1 = stoi(num.substr(1));
                        seatIndex2 = stoi(num.substr(1));

                        if ((zone == 'V' && seatIndex > 0 && seatIndex <= 60 && ar_V[seatIndex] != 1) || (zone == 'C' && seatIndex1 > 0 && seatIndex1 <= 80 && ar_C[seatIndex1] != 1) || (zone == 'N' && seatIndex2 > 0 && seatIndex2 <= 80 && ar_N[seatIndex2] != 1))
                        {
                            if (zone == 'V')
                            {
                                ar_V[seatIndex] = 1;
                                data[0] += 1;
                            }
                            else if (zone == 'C')
                            {
                                ar_C[seatIndex1] = 1;
                                data[1] += 1;
                            }
                            else
                            {
                                ar_N[seatIndex2] = 1;
                                data[2] += 1;
                            }
                            seatCount++;
                        }
                        else
                        {
                            cerr << "\tInvalid seat number." << endl;
                            break;
                        }
                    }
                    if (seatCount != quantity)
                    {
                        cout << "\tPlease enter " << quantity << " seat number(s).\n" << endl;
                    }
                } while (seatCount != quantity);

                calculatePayment(total, nums, token);
                cout << "\tTotal price: RM" << total << endl;
                payment_Method(paymentMethod, total, amountCash);
                receipt(nums, total, paymentMethod, amountCash);
                cout << "\n\tPress enter to display ticket...";
                switch (paymentMethod) {
                case 1:
                case 2:
                    cin.ignore();
                    cin.clear();
                    break;
                case 3:
                    cin.ignore();
                    cin.clear();
                    cin.get();
                    break;
                default:
                    cin.ignore();
                    cin.clear();
                    cin.get();
                }
                ticket(nums, token);
                cout << "\n\tDo you want to continue? (Press Y to continue)";
                cin >> yesNo;
                if (yesNo == 'Y')
                {
                    continue;
                }
                else
                {
                    cout << "\tExit now. Thank you.";
                    return 0;
                }
                break;
            case 2:
                system("cls");
                salesReport(data);
                cout << "\n\tDo you want to continue? (Press Y to continue)";
                cin >> yesNo;
                if (yesNo == 'Y')
                {
                    continue;
                }
                else
                {
                    cout << "\tExit now. Thank you.";
                    return 0;
                }
                break;
            case 3:
                cout << "\tExit now. Thank you.";
                return 0;
            default:
                cerr << "\tInvalid selection. Please try again.\n";
            }
        } while (selection <= 0 || selection > 3);
    }
    return 0;
}

void staffLogin()
{
    const string staffUsername = "123";
    const string staffPassword = "123@";

    string username, password, currentStaff;

    do {
        cout << "\n\t----- Cool Play Concert Ticketing System Staff Login -----\n";
        cout << "\tPlease enter username: ";
        getline(cin, username);
        cout << "\tPlease enter password: ";
        getline(cin, password);

        if (username == staffUsername && password == staffPassword)
        {
            cout << "\tLogin successful, " << username << "!\n";
            currentStaff = staffUsername;
        }
        else {
            cerr << "\tLogin failed. Invalid username or password. Please try again.\n";
        }
    } while (username != staffUsername || password != staffPassword);
}

void menuList(int &selection)
{
    cout << "\n\t****** Cool Play Concert Ticketing System Menu ******\n";
    cout << "\t*                                                   *\n";
    cout << "\t*          1. Seat Layout and Ordering Ticket       *\n";
    cout << "\t*          2. Daily Report                          *\n";
    cout << "\t*          3. Exit                                  *\n";
    cout << "\t*                                                   *\n";
    cout << "\t*****************************************************\n";
    cout << "\n\tEnter your selection: ";
    cin >> selection;
}

void calculatePayment(int& total, string& nums, string &token)
{
    int vipPrice = 0, catPrice = 0, normalPrice = 0;

    istringstream iss(nums);

    while (iss >> token)
    {
        char seatType = toupper(token[0]);
        int seatIndex = stoi(token.substr(1));

        switch (seatType)
        {
        case 'V':
            // Assuming VIP price is 890
            vipPrice += 890;
            break;
        case 'C':
            // Assuming CAT price is 450
            catPrice += 450;
            break;
        default:
            // Assuming NORMAL price is 280
            normalPrice += 280;
        }
    }
    // Calculate total price based on quantities
    total = vipPrice + catPrice + normalPrice;
}

bool isDigitsOnly(const string& expiryDate)
{
    return all_of(expiryDate.begin(), expiryDate.end(), ::isdigit);
}

void payment_Method(int& paymentMethod, int& total, int& amountCash)
{
    char ch;
    int cardCVV;
    string cardNum, expiryDate, bankOnline, bankUsername, bankPassword;
    bool isValid = false;

    cout << "\n\t========= Payment Methods ==========";
    cout << "\n\t=                                  =";
    cout << "\n\t=     1. Credit / Debit Card       =";
    cout << "\n\t=     2. FPX Online Banking        =";
    cout << "\n\t=     3. Cash                      =";
    cout << "\n\t=                                  =";
    cout << "\n\t====================================" << endl;
    do {
        cout << "\tEnter your payment method selection: ";
        cin >> paymentMethod;
        cin.ignore();

        switch (paymentMethod) {
        case 1:
            cout << "\n\t$$$$$ Credit / Debit Card $$$$$";
            do {
                cout << "\n\tCard number (XXXX XXXX XXXX XXXX): ";
                getline(cin, cardNum);
                cardNum.erase(remove(cardNum.begin(), cardNum.end(), ' '), cardNum.end());
                if (all_of(cardNum.begin(), cardNum.end(), ::isdigit) && cardNum.length() == 16)
                    break;
                else
                    cerr << "\tInvalid card number. Please enter a 16-digit numeric card number." << endl;
            } while (true);
            do {
                cout << "\n\tExpiry date (MM/YY): ";
                getline(cin, expiryDate);
                expiryDate.erase(remove_if(expiryDate.begin(), expiryDate.end(), ::isspace), expiryDate.end());
                if (isDigitsOnly(expiryDate.substr(0, 2)) && isDigitsOnly(expiryDate.substr(3, 2)) && expiryDate.length() == 5 && expiryDate[2] == '/')
                    break;
                else
                    cerr << "\tInvalid expiry date of card. Please enter a 4-digit numeric expiry date in the format MM/YY." << endl;
            } while (true);
            do {
                cardCVV = 0;
                cout << "\n\tCVV: ";
                while (true) {
                    ch = _getch();
                    if (ch == 13)
                        break;
                    if (isdigit(ch)) {
                        int digit = ch - '0';
                        cardCVV = cardCVV * 10 + digit;
                        cout << "*";
                    }
                }
                if (cardCVV >= 100 && cardCVV < 1000)
                {
                    isValid = true;
                }
                else
                {
                    cerr << "\n\tInvalid CVV.." << endl;
                    isValid = false;
                }
            } while (!isValid);
            cout << endl;
            cout << "\n\tProcessing payment ......" << endl;
            cout << "\tAccepting payment ......" << endl;
            cout << "\tPayment successful" << endl;
            //receipt
            break;
        case 2:
            cout << "\n\t$$$$$ FPX Online Banking $$$$$";
            //show receipt
            cout << "\n\tEnter the selected bank: ";
            getline(cin, bankOnline);
            do
            {
                cout << "\n\tAccount username (8 - 12 characters): ";
                getline(cin, bankUsername);
                if (bankUsername.length() < 8 || bankUsername.length() > 12)
                    cerr << "\tInvalid account username." << endl;
            } while (bankUsername.length() < 8 || bankUsername.length() > 12);
            do
            {
                bankPassword = "";
                cout << "\n\tPassword (8 - 12 characters): ";
                while (true) {
                    ch = _getch();
                    if (ch == 13)
                        break;
                    if (isprint(ch)) {
                        bankPassword += ch;
                        cout << '*';
                    }
                }
                if (bankPassword.length() >= 8 && bankPassword.length() <= 12)
                {
                    isValid = true;
                }
                else
                {
                    cerr << "\n\tInvalid password." << endl;
                    isValid = false;
                }
            } while (!isValid);
            cout << endl;

            cout << "\n\tProcessing payment ......" << endl;
            cout << "\tAccepting payment ......" << endl;
            cout << "\tPayment successful" << endl;
            break;
        case 3:
            cout << "\n\tTotal price : RM" << total << endl;
            cout << "\tCash : RM";
            cin >> amountCash;
            cout << "\tChange Due : RM" << amountCash - total << endl;
            break;
        default:
            cerr << "\tInvalid payment method.\n\n";
        } 
    } while (paymentMethod < 1 || paymentMethod > 3);
}

void receipt(string& nums, int& total, int& paymentMethod, int& amountCash)
{
    time_t t = time(nullptr);
    tm tm;
    ostringstream oss;
    int balance;

    cout << "\n\t* * * * * * * * * * * * * * * * * * * * *" << endl;
    cout << "\t*" << setw(23) << "RECEIPT" << setw(17) << "*" << endl;
    cout << "\t*" << setw(27) << "Cool Play Concert" << setw(13) << "*" << endl;
    if (localtime_s(&tm, &t) == 0) {
        oss << put_time(&tm, "%Y-%m-%d %H:%M:%S");
        cout << "\t" << left << setw(15) << "*" << oss.str() << setw(20 - oss.str().length()) << right << setw(7) << "*" << endl;
    }
    else {
        cerr << "Failed to get local time" << endl;
    }
    cout << right;
    cout << "\t*" << setw(40) << "*" << endl;
    cout << "\t*" << " Seat Number : " << nums << setw(25 - nums.length()) << "*" << endl;
    if (total < 1000)
        cout << "\t*" << " Total Price :" << setw(21) << "RM" << total << " *" << endl;
    else
        cout << "\t*" << " Total Price :" << setw(20) << "RM" << total << " *" << endl;
    if (paymentMethod == 1)
    {
        cout << "\t*" << " Change Due :" << setw(25) << "RM0" << " *" << endl;
        cout << "\t*" << " Payment Method :" << setw(21) << "Credit / Debit Card" << " *" << endl;
    }
    else if (paymentMethod == 2)
    {
        cout << "\t*" << " Change Due :" << setw(25) << "RM0" << " *" << endl;
        cout << "\t*" << " Payment Method :" << setw(21) << "FPX Online Banking" << " *" << endl;
    }
    else {
        if (amountCash > 0 && amountCash < 10000)
            if (amountCash < 1000)
                cout << "\t*" << " Cash :" << setw(28) << "RM" << amountCash << " *" << endl;
            else
                cout << "\t*" << " Cash :" << setw(27) << "RM" << amountCash << " *" << endl;
        balance = amountCash - total;
        if (balance >= 0 && balance < 100)
            if (balance < 100 && balance >= 10)
                cout << "\t*" << " Change Due :" << setw(23) << "RM" << balance << " *" << endl;
            else
                cout << "\t*" << " Change Due :" << setw(24) << "RM" << balance << " *" << endl;
        cout << "\t*" << " Payment Method :" << setw(21) << "Cash" << " *" << endl;
    }
    cout << "\t* " << setfill('-') << setw(26) << " Check Closed " << setw(13) << " *" << endl;
    cout << setfill(' ');
    cout << "\t*" << setw(40) << "*" << endl;
    cout << "\t*" << setw(32) << " Thank you for Purchasing." << setw(8) << "*" << endl;
    cout << "\t* * * * * * * * * * * * * * * * * * * * *\n" << endl;
}

void ticket(string& nums, string &token)
{
    cout << "\n" << setw(67) << "======== Ticket ========" << endl;

    srand(time(NULL));

    istringstream iss(nums);

    const string intro = "You are going to", tearintro = "Admit one", event = "Cool Play Concert", date = "Apr 6,2024", venue = "Stadium Bukit Jalil ", time = "6:00pm";
    const string tearinfor1 = "Thank you for supporting us";
    const string infor1 = "Arrive early for security checks | No outside F&B allowed";
    const string infor2 = "Seated, no admission for children aged below 3 years old";
    const string infor3 = "Standing, no admission for children aged below 12 years old";
    const string infor4 = "No photography, videography or live streaming allowed";

    while (iss >> token)
    {
        cout << "\t" << setfill('-') << left << setw(93) << " " << endl;

        for (int runtime = 0; runtime < 12; runtime++)
        {
            if (runtime == 0)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(20) << " " << intro << setfill(' ') << left << setw(25) << " "
                    << setfill('|') << right << setw(2);
                cout << " " << setfill(' ') << right << setw(8) << " " << tearintro << setfill(' ') << left << setw(10) << " " << setfill('|') << left << setw(2) << " " << "\n";
            }
            else if (runtime == 2)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(20) << " " << event << setfill(' ') << left << setw(24) << " "
                    << setfill('|') << right << setw(2);
                cout << " " << setfill('|') << tearinfor1 << setfill('|') << left << setw(2) << " " << "\n";
            }
            else if (runtime == 4)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(6) << " " << date << setfill(' ') << right << setw(14) << time <<
                    setfill(' ') << right << setw(28) << venue << " " << setfill(' ') << right << setw(2) << " " << setfill('|') << right << setw(2);
                cout << "|" << setfill('|') << setw(30) << "\n";
            }
            else if (runtime == 5)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(61) << " " << setfill('|') << right << setw(2);
                cout << "|" << setfill('|') << setw(30) << "\n";
            }
            else if (runtime == 6)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(61) << " " << setfill('|') << right << setw(2);
                cout << " " << setfill('|') << "   " << rand() % 9000000000000000000 + 10000000000000000000 << "    " << setfill('|') << left << setw(2) << " " << "\n";
            }

            else if (runtime == 8)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << left << infor2 << setfill(' ') << setw(5) << left
                    << " " << setfill('|') << right << setw(2);
                cout << " " << setfill('|') << "Date:" << date << setfill(' ') << right << setw(12) << " " << setfill('|') << left << setw(2) << " " << "\n";
            }

            else if (runtime == 9)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << left << infor3 << setfill(' ') << setw(2) << left
                    << " " << setfill('|') << right << setw(2);
                cout << " " << setfill('|') << "Time:" << time << setfill(' ') << right << setw(16) << " " << setfill('|') << left << setw(2) << " " << "\n";
            }

            else if (runtime == 10)
            {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << left << infor4 << setfill(' ') << setw(8) << left
                    << " " << setfill('|') << right << setw(2);
                cout << " " << setfill('|') << "Seat:" << token << setfill(' ') << right << setw(19) << " " << setfill('|') << left << setw(2) << " " << "\n";
            }

            else {
                cout << "\t|" << setfill(' ') << right << setw(2) << " " << setfill(' ') << right << setw(61) << " " << setfill('|') << right << setw(2);
                cout << " " << setfill(' ') << right << setw(27) << " " << setfill('|') << left << setw(2) << " " << "\n";
            }
        }
        cout << "\t" << setfill('-') << left << setw(93) << " " << endl << setfill(' ') << right;
        cout << endl;
    }
}

void salesReport(vector<int>& data) {
    int totalSeats, max = *max_element(data.begin(), data.end());

    cout << "\t" << setw(54) << "Daily Report" << endl;
    cout << " \t+ ---------------- + ---------------- + ---------------- + ---------------- + ---------------- + " << endl;
    cout << " \t| Zone \\ Detail    |   Quantity Sold  |   Quantity Left  |  Unit Price(RM)  |  Total Sales(RM) | " << endl;
    cout << " \t+ ---------------- + ---------------- + ---------------- + ---------------- + ---------------- + " << endl;
    cout << " \t| VIP ZONE         |               " << setw(2) << data[0] << " |               " << setw(2) << 60 - data[0] << " |              890" << " |            " << setw(5) << data[0] * 890 << " |" << endl;
    cout << " \t+ ---------------- + ---------------- + ---------------- + ---------------- + ---------------- + " << endl;
    cout << " \t| CAT ZONE         |               " << setw(2) << data[1] << " |               " << setw(2) << 80 - data[1] << " |              450" << " |            " << setw(5) << data[1] * 450 << " |" << endl;
    cout << " \t+ ---------------- + ---------------- + ---------------- + ---------------- + ---------------- + " << endl;
    cout << " \t| NORMAL ZONE      |               " << setw(2) << data[2] << " |               " << setw(2) << 80 - data[2] << " |              280" << " |            " << setw(5) << data[2] * 280 << " |" << endl;
    cout << " \t+ ---------------- + ---------------- + ---------------- + ---------------- + ---------------- + " << endl;
    cout << "                                                                                    |          " << setw(7) << (data[0] * 890 + data[1] * 450 + data[2] * 280) << " |" << endl;
    cout << "                                                                                    + ---------------- + " << endl << "\n\n";

    for (int i = max; i > 0; --i) {
        for (int value : data) {
            if (value >= i)
            {
                cout << setw(16) << "***";
            }
            else
            {
                cout << setw(16) << "    ";
            }
        }
        cout << endl;
    }

    for (int i = 0; i < data.size(); ++i)
    {
        cout << "\t" << setw(10) << "--------";
    }
    cout << endl;

    cout << "\t" << setw(10) << "VIP ZONE";
    cout << setw(16) << "CAT ZONE";
    cout << setw(18) << "NORMAL ZONE" << endl;

    for (int value : data) {
        if (value == data[0])
            cout << setw(15) << value;
        else if (value == data[1])
            cout << setw(16) << value;
        else
            cout << setw(18) << value;
    }

    totalSeats = data[0] + data[1] + data[2];

    cout << endl;

    cout << "\t*** stand for 1 seat" << endl;
    cout << "\t" << totalSeats << " seats had been sold." << endl;
}
