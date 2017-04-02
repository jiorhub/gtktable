/**
 * Основной модуль 
 *
 * Copyright: (c) 2015-2017, Oleg Lelenkov.
 * License: Proprietary
 * Authors: Oleg Lelenkov
 */
module app;

private
{
    import gtk.Main;
    import fssp.window;
}



void main(string[] args)
{
    Main.init(args);
    new CustomListWindow();
    Main.run();
}

