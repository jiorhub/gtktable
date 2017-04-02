module mainwindow;

import gtk.MainWindow: GtkMainWindow = MainWindow;
import gtk.MenuBar;
import gtk.Menu;
import gtk.MenuItem;
import gtk.EventBox;
import gtk.Label;
import gdk.Event;
import gtk.Widget;
import gtk.VBox;
import gtk.HandleBox;
import gtk.ToolButton;
import gtk.Toolbar;
import gtk.AccelGroup;

private import stdlib = core.stdc.stdlib : exit;

import gi18n;
alias _ = I18n.gettext;


class MainWindow : GtkMainWindow {
    this() {
        super("DCore");
        setDefaultSize(300, 100);
        VBox mainBox = new VBox(false, 0);
 
        mainBox.packStart(createMenuBar(), false, false, 0);
        //mainBox.packStart(createToolBar(), false, false, 0);

        add(mainBox);
        showAll();
    }

    private MenuBar createMenuBar() {
        MenuBar menuBar = new MenuBar();
        AccelGroup accelGroup = new AccelGroup();
        addAccelGroup(accelGroup);

        Menu menu = menuBar.append(_("_File"));
        menu.append(new MenuItem(&onMenuActivate, _("_New"), "file.new", true, accelGroup, 'n'));
        menu.append(new MenuItem(&onMenuActivate, _("_Open"), "file.open", true, accelGroup, 'o'));
        menu.append(new MenuItem(&onMenuActivate, _("_Close"), "file.close", true, accelGroup, 'c'));
        menu.append(new MenuItem(&onMenuActivate, _("E_xit"), "file.exit", true, accelGroup, 'x'));

        menu = menuBar.append(_("_Edit"));
        menu.append(new MenuItem(&onMenuActivate, _("_Find"), "edit.find", true, accelGroup, 'f'));
        menu.append(new MenuItem(&onMenuActivate, _("_Search"), "edit.search", true, accelGroup, 's'));

        menu = menuBar.append(_("_Help"));

        return menuBar;    
    }

    private Widget createToolBar() {
        HandleBox handleBox = new HandleBox();
        Toolbar toolBar = new Toolbar();
        toolBar.insert(new ToolButton(StockID.OPEN));

        handleBox.add(toolBar);
        return handleBox;    
    }

    void onMenuActivate(MenuItem menuItem) {
        string action = menuItem.getActionName();
        switch(action) {
            case "file.exit":
                stdlib.exit(0);
                break;
            default:
                break;
            break;
        }
    }
}
