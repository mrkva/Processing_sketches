import proxml.*;

// create the root element be specific where the class is
proxml.XMLElement file = new proxml.XMLElement("root");

// create the color element
proxml.XMLElement timestamp = new proxml.XMLElement("timestamp");

// add some attributes to it.
timestamp.addAttribute("year", year());
timestamp.addAttribute("month", month());
timestamp.addAttribute("day", day());
timestamp.addAttribute("hour", hour());
timestamp.addAttribute("minutes", minute());

// make the color element a child of the root element
file.addChild(timestamp);

proxml.XMLElement timestamp = new proxml.XMLElement("timestamp");

// create an XMLInOut object to format the elements
XMLInOut xmlInOut =  new XMLInOut(this);

// and call saveElement.
xmlInOut.saveElement(file, "data.xml");
