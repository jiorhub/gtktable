module app;

import std.file: getcwd;
import std.path: buildPath;
import core.stdc.locale;

import gtk.Main;

import gi18n;
import mainwindow;

void main(string[] args) {
    I18n.setLocale(LC_ALL, "");
    I18n.bindtextdomain("messages", buildPath(getcwd(), "locale"));
    I18n.textdomain("messages");

    Main.init(args);       
    new MainWindow();
    Main.run();
}
