using Raylib_cs;
using System.Numerics;

namespace Etape_1_projet_PSI
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double angle_a_incrementer = 360 / 33;
            double angle = 0;
            
            Graph etape_1 = new Graph("soc-karate.txt", 33);
            Console.WriteLine("\n\t\tMatrice Adjacence\n");
            etape_1.affiche_graphe_adjacencte();
            Console.WriteLine("\n\t\tList Adjacence\n");
            etape_1.Afficher_List_Adjacence();

            Console.WriteLine("\n\t\tDFS de 0\n");
            etape_1.DFS(0);
            Console.WriteLine("\n\t\tBFS de 0\n");
            etape_1.BFS(0);

            Console.WriteLine(etape_1.Verification_Connexite()); 

            Console.WriteLine("\n\t\tnb_de_circuit de 0\n");
            Console.WriteLine(etape_1.DFS_detection_circuit(0));

            etape_1.Draw_Graph();
        }
    }
}