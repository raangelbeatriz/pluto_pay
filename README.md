# Pluto Pay

## ✨ About
Pluto App is a project whose goal was to develop a payment link interface, where users can perform payments with their own cards. The idea was to develop a simple app that could also detect frauds locally.

### 💰 Fun Fact
Pluto  is the Greek god of abundance and wealth, so it makes sense to have a payment app with his name, at least I think so.

## ⚡ Demo
![Screen_Recording_20240619_084543 (1)](https://github.com/raangelbeatriz/pluto_pay/assets/50742224/4ddba02f-d4b1-47b9-afc2-25bdb38d3935)


## 📖 Main Technologies
- Flutter
- Bloc/Cubit and Modular
- Dio
- Mocktail

## 💡 Features
- Sign In
- Payment
- Select Card
- Register Card
  
## 🛠 Possible New Features
- Add real validation to the textfields, for now it only checks if the fields are empty
- Improvement of the select and register card so the user can see an image of the card`s brand
- Make new screens where the user can check and sort old transactions
- Add more tests especially cubit ones
- Connect to a real backend


## ✏️ Tests
For testing, I used Mocktail, and try to test a few key layers, such as the data and domain layer.

## 🚀 How to use
- Clone this project
```sh
git clone https://github.com/raangelbeatriz/movie_clean_arch
```
- Open the project and run
```sh
flutter pub get
```
- Run the project with the command
```sh
flutter run
```

## 👩🏼‍🔧 Understanding more about the Payment World

### Main Players
- **Customer:** The person making the purchase.
- **Merchant:** The business selling products or services.
- **Acquirer:** The financial institution that processes credit or debit card payments on behalf of the merchant.
- **Issuer:** The bank or financial institution that issued the customer’s payment card.
- **Card Network:** The intermediary that connects acquirers and issuers, like Mastercard, for instance.
- **Payment Gateway:** A service that facilitates the transfer of information between the merchant and the acquirer.

  
#### Money Flow
The customer initiates the payment using a credit card to pay for a service from a merchant. The merchant sends the transaction details to the acquiring bank to process the payment. The card network routes the transaction to the issuing bank, issuer, that issued the customer's payment card. Then, the issuer checks if the customer has enough funds. If so, the issuer authorizes the transaction and informs the acquirer. The acquirer then informs the merchant about the authorization or decline of the transaction. Finally, the issuer transfers the funds to the card network, which then routes them to the acquirer. The acquirer deposits the funds into the merchant's account, minus any fees.

To summarize: 

** Customer → Merchant → Acquier Bank → Card Network → Issuer **

And then the the information makes the reverse path until the merchant is paid.

### Information Flow
The customer provides the payment information at the store, either online or in a physical location. This data is encrypted and transmitted to the payment gateway. The payment gateway sends an authorization request to the acquirer, who forwards the request to the card network. The card network then forwards it to the issuer. The issuer verifies the information and responds with an authorization or decline, and this information is sent back until the merchant is notified of the authorization status.

### Acquier, Sub-Acquier and Payment Gateway
- **Acquier:** An acquirer processes credit and debit card transactions for merchants. It acts as the intermediary between the merchant and the card networks.
- **Sub-Acquirer:** A sub-acquirer is a third party that provides payment processing services to merchants, typically working under an agreement with a primary acquirer. They often have clients who are smaller merchants who might not have direct access to acquirers.
- **Payment Gateway:** A payment gateway is a technology provider that facilitates the secure transmission of transaction data from the merchant to the acquirer.

When a Sub-Acquier it acts like an intermediate to the merchant and the accquier so the money and information flow and money flow sligthy changes.

### Chargeback analyzes
To make this app I had to understand how chargebacks works and analyze some data. Upon analyzing the data, I discovered some suspicious behaviors, such as a higher risk of fraud occurring late in the evenings, particularly between 7 PM and 1 AM. I also found that during these hours, high-value transactions are more likely to be fraudulent.

Another notable aspect is the recurrence of fraud among users who have previously had chargebacks due to fraud. This leads me to conclude that certain users have a higher chance of committing fraud at any time of the day.

To address this, I suggest implementing an algorithm that specifically checks for fraud during late evenings and for high-value transactions. Additionally, it should flag suspicious users to prevent them from making further transactions after a fraud chargeback, at least until the financial institution can better analyze the problem, such as determining if the user has been hacked. Moreover, a more robust system should be developed that analyzes both user and merchant data, as well as suspicious behaviors, and learns from patterns of previous users and transactions.

   
   >This project was developed ❤️ by **[@Beatriz Rangel](https://www.linkedin.com/in/beatrizorangel/)**
   ---
