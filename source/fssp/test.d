/**
 *  
 *
 * Copyright: 
 * License: 
 * Authors: 
 */
module fssp.test;

private
{
    import gtk.Main;
    import gtk.MainWindow;
    import gtk.CssProvider;
    import gtk.StyleContext;
    import gtk.Button;
    import gtk.Label;
    import gtk.Box;
    import gtkc.gtktypes : GtkOrientation;

    import gdk.Screen;
}

enum stylePath = "gtk.css";

void loadCss(string path)
{
    auto screen = Screen.getDefault();
    CssProvider provider = new CssProvider();
    provider.loadFromPath(path);
    StyleContext.addProviderForScreen(screen, provider, uint.max);
}


class HelloWindow : MainWindow
{
    private Label _stLabel;

    this()
    {
        super("Hello World!!!");
        setDefaultSize(300, 100);
        auto box = new Box(GtkOrientation.VERTICAL, 20);
        _stLabel = new Label("Click a Button");
        box.add(_stLabel); 
        box.add(new Button("Button 1", &onBtn1));
        box.add(new Button("Exit", &onBtn2));
        box.add(new Button("About", &onBtn3));
        add(box);
    }


    void onBtn1(Button button)
    {
        _stLabel.setText("You clicked Button 1");
    }

    void onBtn2(Button button)
    {
        _stLabel.setText("You clicked Exit");
    }

    void onBtn3(Button button)
    {
        _stLabel.setText("You clicked About");
    }
}

