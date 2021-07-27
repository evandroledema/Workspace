// monthlyBudget.cpp
/***********************************************
* Author: Evandro F. Ledema
* Electrical and Software Engineer
* C/C++, ASM, Java, Kotlin, Python.
* This program show a monthly budget.
************************************************/

//iomanip is used for setw()
#include <iostream>
#include <iomanip>

//is better than >> using namespace std
using std::cout;
using std::cin;
using std::endl;
using std::ios;
using std::setw;

//declaring all functions
double getIncome();
double getLiving();
double getActualLiving();
double getActualOther();
double getActualTithing();
double getActualTax();
double computeTax(double income);
double computeTithing(double income);
void display(double income,
    double tithing,
    double other,
    double budgetLiving,
    double actualLiving,
    double tax);

//This main function will call all the others
int main()
{
    //this will set the fixed point to 2 decimals
    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(2);

    cout << "This program keeps track of your monthly budget\n";
    cout << "Please enter the following: " << endl;

    double income = getIncome();
    double budgetLiving = getLiving();
    double actualLiving = getActualLiving();
    double other = getActualOther();
    double tithing = getActualTithing();
    double tax = getActualTax();
    display(income,
        tithing,
        other,
        budgetLiving,
        actualLiving,tax);

    return 0;
}

//get income from user
double getIncome()
{
    double income;

    cout << "\tYour monthly income: ";
    cin >> income;

    return income;
}

//get living from user
double getLiving()
{
    double budgetLiving = 0;

    cout << "\tYour budgeted living expenses: ";
    cin >> budgetLiving;

    return budgetLiving;
}

//get actual living from user
double getActualLiving()
{
    double actualLiving = 0;

    cout << "\tYour actual living expenses: ";
    cin >> actualLiving;

    return actualLiving;
}

//get others expenses from user
double getActualOther()
{
    double other = 0;

    cout << "\tYour actual taxes withheld: ";
    cin >> other;

    return other;
}

//get actual tithing from user, althoug it is supposed to be 10%.
double getActualTithing()
{
    double tithing = 0;

    cout << "\tYour actual tithe offerings: ";
    cin >> tithing;

    return tithing;
}

//get the actual tax value from user
double getActualTax()
{
    double tax = 0;

    cout << "\tYour actual other expenses: ";
    cin >> tax;

    return tax;
}

//This function computes tax accordingly with the following table:
double computeTax(double income)
{
    double tax = 0,
        yearlyIncome = income * 12;

    if (yearlyIncome >= 336'550)
        tax = 91'043 + 0.35 * (yearlyIncome - 336'550);
    else if (yearlyIncome >= 188'450)
        tax = 42'170 + 0.33 * (yearlyIncome - 188'450);
    else if (yearlyIncome >= 123'700)
        tax = 24'040 + 0.28 * (yearlyIncome - 123'700);
    else if (yearlyIncome >= 61'300)
        tax = 8'440 + 0.25 * (yearlyIncome - 61'300);
    else if (yearlyIncome >= 15'100)
        tax = 1'510 + 0.15 * (yearlyIncome - 15'100);
    else tax = yearlyIncome * 0.10;

    double montlyTax = tax / 12;

    return montlyTax;
}

//computes the correct tithing value
double computeTithing(double income)
{
    double tithing = income * .10;
    return tithing;
}

//this is the display function that gets all the info from the geters and returns to the screen.
void display(double income,
    double tithing,
    double other,
    double budgetLiving,
    double actualLiving,
    double tax)
{
    double budgetTax = computeTax(income);
    double actualTithing = computeTithing(income);

    double budgetOther = 0;

    double differenceBudget = income - (tithing + budgetTax + budgetLiving + budgetOther);
    double differenceActual = income - (actualTithing + tax + actualLiving + other);

    cout << "The following is a report on your monthly expenses\n";
    cout << "\tItem                  Budget          Actual\n";
    cout << "\t=============== =============== ===============\n";
    cout << "\tIncome          $" << setw(11) << income << "     $" << setw(11) << income << endl;
    cout << "\tTaxes           $" << setw(11) << budgetTax << "     $" << setw(11) << tax << endl;
    cout << "\tTithing         $" << setw(11) << tithing << "     $" << setw(11) << actualTithing << endl;
    cout << "\tLiving          $" << setw(11) << budgetLiving << "     $" << setw(11) << actualLiving << endl;
    cout << "\tOther           $" << setw(11) << budgetOther << "     $" << setw(11) << other << endl;
    cout << "\t=============== =============== ===============\n";
    cout << "\tDifference      $" << setw(11) << differenceBudget << "     $" << setw(11) << differenceActual << endl;

}