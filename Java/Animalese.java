import java.util.*;
import java.io.FileWriter;
import java.io.IOException;

public class Animalese {
  public static void main(String[] args) {
    Speech speech = new Speech();
    speech.textToSpeech("Example");
  }
}

class Speech {
  public void textToSpeech(String stringy) {
    System.out.println("initializing...");
    String filename = stringy.toLowerCase();
    filename = filename.replaceAll(" ", "_");
    filename = filename.replace(".", "_");
    double rnd_factor;
    String pitch = "high";

    stringy = stringy.toLowerCase();

    String[] keys = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "th", "sh", " ", "."};
    Hashtable<String,String> sounds = new Hashtable<String,String>();
    for (int index = 0, ltr = 0; index < keys.length && ltr < keys.length; index++, ltr++) {
      int numint = index + 1;
      String num;
    	if (numint < 10) {
        num = "0" + Integer.toString(numint);
      } else {
        num = Integer.toString(numint);
      }
    	sounds.put(keys[ltr], System.getProperty("user.dir") + "/sounds/" + pitch + "/sound" + num + ".wav");
    }

    if (pitch == "med") {
      rnd_factor = 0.35;
    } else {
      rnd_factor = 0.25;
    }

    ArrayList<String> infiles = new ArrayList<String>();

    for (int i = 0, chr = 0; i < stringy.length() && chr < stringy.length(); i++, chr++) {
    	try {
    		if (stringy.charAt(chr) == 's' && stringy.charAt(i+1) == 'h') {
    			infiles.add(sounds.get("sh"));
    			continue;
        } else if (stringy.charAt(chr) == 't' && stringy.charAt(i+1) == 'h') {
    			infiles.add(sounds.get("th"));
    			continue;
        } else if (stringy.charAt(chr) == 'h' && (stringy.charAt(i-1) == 's' || stringy.charAt(i-1) == 't')) {
    			continue;
        }	else if (stringy.charAt(chr) == ',' || stringy.charAt(chr) == '?') {
    			infiles.add(sounds.get("."));
    			continue;
        } else if (stringy.charAt(chr) == stringy.charAt(i-1)) {
    			continue;
        }
      } catch (Exception e) {
        ;
      }

    	if (!Character.isLetter(stringy.charAt(chr)) && stringy.charAt(chr) != '.') {
    		continue;
      }
    	infiles.add(sounds.get(String.valueOf(stringy.charAt(chr))));
    }

    try (FileWriter myWriter = new FileWriter("changepitch.bat")) {
      for (int index = 0, sound = 0; index < infiles.size() && sound < infiles.size(); index++, sound++) {
        double octaves;
        if (stringy.charAt(stringy.length() - 1) == '?') {
      		if (index >= infiles.size() * 0.8) {
      			octaves = Math.random() * rnd_factor + (index - index * 0.8) * 0.1 + 2.1;
      		} else {
            octaves = Math.random() * rnd_factor + 2.0;
          }
    	  } else {
          octaves = Math.random() * rnd_factor + 2.3;
        }
        myWriter.write("ffmpeg -i " +
        infiles.get(sound) +
        " -af asetrate=44100*" +
        Double.toString(Math.pow(2, octaves)) +
        ",aresample=44100 " +
        infiles.get(sound).substring(0, (infiles.get(sound).length() - 11)) +
        "mom/" +
        Integer.toString(index) +
        ".wav" +
        "\n");
      }
    } catch (IOException e) {
        System.out.println("An error occurred...");
        e.printStackTrace();
    }

    try (FileWriter myWriter = new FileWriter(filename + ".txt")) {
      for (int index = 0, sound = 0; index < infiles.size() && sound < infiles.size(); index++, sound++) {
        myWriter.write("file " + "'" + infiles.get(sound).substring(0, (infiles.get(sound).length() - 11)) +
        "mom/" +
        Integer.toString(index) +
        ".wav" +
        "\n");
      }
      myWriter.close();
    } catch (IOException e) {
        System.out.println("An error occurred...");
        e.printStackTrace();
    }

    System.out.println("Successfully wrote to the file.");

    try (FileWriter myWriter = new FileWriter(filename + ".bat")) {
          myWriter.write("ffmpeg -f concat -safe 0 -i " + filename + ".txt -c copy " + filename + ".wav");
          myWriter.close();
      } catch (IOException e) {
          System.out.println("An error occurred...");
          e.printStackTrace();
      }
      System.out.println("Successfully wrote to the file.");
    }
}
