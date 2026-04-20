thought_process = "<?xml version='1.0' encoding='UTF-8'?>
<?xml-stylesheet type='text/css' href='aimap.css'?>

<screen>
  <container>
    <description>
      <routine_name>Grinding Pigment</routine_name>
      <technical_description>Purchase pigment or grind it yourself.</technical_description>
      <laymans>You can either purchase pigment online, or find a natural soft stone or other substrate and grind it yourself.</laymans>
    </description>
  </container>

  <connection> | </connection>

  <container>
    <description>
      <routine_name>Mixing Pigment</routine_name>
      <technical_description>Mix pigment with vinegar and binding agent.</technical_description>
      <laymans>The pigment, vinegar, and binding agent is mixed.</laymans>
    </description>
  </container>

  <connection> | </connection>

  <container>
    <description>
      <routine_name>Fermentation / Pickling</routine_name>
      <technical_description>Ferment mixture from 3-6 months.</technical_description>
      <laymans>Ferment mixture in an old bottle inside an unused cabinet or closet that has little sunset and stays cooler than the rest of the house.</laymans>
    </description>
  </container>

  <connection> | </connection>

  <container>
    <description>
      <routine_name>Shake Well</routine_name>
      <technical_description>Rinse Bottle. Shake Ink.</technical_description>
      <laymans>Shaking the bottle gently if pigment settles to bottom. If the top is difficult to open, rinse in warm water to relieve pressure. This ink is best used with watercolor and Sumi brushes.</laymans>
    </description>
  </container>
</screen>"

File.open("_visualsteps/makeink.xml", "w") { |f|
  f.puts thought_process
}
