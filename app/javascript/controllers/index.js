// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import OfferController from "./offer_controller"
application.register("offer", OfferController)

import TransactionController from "./transaction_controller"
application.register("transaction", TransactionController)
