   M S B A M L   `   `   `  ����H  DTehtävä2WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:Tehtävä2WPFTehtävä2WPF  5   	       Tehtävä2WPF.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:Tehtävä2WPF     5   	     � Title$  
MainWindow��5   	   $��572.023��6   $	��525��6-    � 	Resources 5	       � XPath   	Countries��%2   &	        � 5   
   $ 	/DATA/ROW��6   6,   5      .��5      � $��0,0,0,11q�6   .+�5   
   �� -   5         ��Name$ maatComboBox��5      $
��Left=�6)   $��	10,26,0,0q�6D   $	��Top=�6W   $	��120��6o   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ countriesDataGrid��5   p    � DataContext# [  6+      AutoGenerateColumns .  $
��Left=�6�   $	��248��6�   $��	10,62,0,0q�6�   $	��Top=�6�   $	��497��6�   ��6   ��    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$
 Nimi��6D   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6%   �� 
 �� XPath$

 Name��6D     5      $ Maanosa��6I   	 6%   �� $
 	Continent��6I     5      $ 
Asukasluku��6J   	 6%   �� $
 
Population��6J     5      $ Paikallinen nimi��6I   	 6%   �� $
 	Localname��6I     5      $ Maan johtaja��6K   	 6%   �� $
 HeadOfState��6K   5      �� 5   
   -   5         ��Name$ laskeMaatButton��5      $��
Laske maat��6*   $
��Left=�6?   $��
10,315,0,0q�6Z   $	��Top=�6n   $��75��6�   6�   �� 5   
   -   5         ��Name$ laskeMaatLabel��5      $�� ��6(   $
��Left=�63   $��
10,337,0,0q�6N   $	��Top=�6b   $��26��6z   �� 5   
   -   5        $' !asukaslukujenYhteismääräButton��5      $"��Asukaslukujen yhteismäärä��69   $
��Left=�6]   $��
97,315,0,0q�6x   $	��Top=�6�   $	��166��6�   6�   �� 5   
   -   5        $&  asukaslukujenYhteismääräLabel��5      $�� ��67   $
��Left=�6B   $��135,342,0,0q�6]   $	��Top=�6r   �� 5   
   -   5         ��Name$ hakuTextBox��5      $
��Left=�6'   $��23��6B   $��
215,26,0,0q�6N    �� TextWrapping$
 Wrap=�6b   $	��Top=�6v   $	��120��6�   �� 5   
   -   5        $ 
etsiButton��5      $	��Hae��6%   $
��Left=�63   $��
135,26,0,0q�6N   $	��Top=�6b   $��75��6z   6�   �� 5   
   -	   5        $ haeAsukaslukuButton��5      $%��Hae 10 asukasluvultaan suurinta��6.   $
��Left=�6X   $��
10,404,0,0q�6s   $	��Top=�6�   $	��187��6�   6�   �� 5   
   -
   5        $ haePintaAlaButton��5      $$��Hae 10 Pinta-alaltaan suurinta��6,   $
��Left=�6U   $��
10,431,0,0q�6p   $	��Top=�6�   $	��187��6�   6�   �� 5    
   -   5        $ button��5       $	��Hae��6!   $
��Left=�6/   $��
340,26,0,0q�6J   $	��Top=�6^   $��75��6v   6�   5!      5"      