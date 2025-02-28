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

            //On remarque que il y a deux composantes connexes a ce graphes 

            //la composante 20 - 32 ne peuvent pas former un cycle (graphe simple)
            //regardons l'autre composante connexe 

            Console.WriteLine("\n\t\tnb_de_circuit de 0\n");
            Console.WriteLine(etape_1.DFS_detection_circuit(0));

            //caractéristique : 
            /* graphe non orientée
             * non pondéré 
             * non planaire (a verifier)
             * non complet
             * non connexe mais possède deux composante connexe
             * simple 
             * graph non bipartie (a verifier)
             */

            etape_1.Draw_Graph();
        }
    }
}

/*
 for(int i = 0; i < 33; i++)
                {
                    Raylib.DrawCircle(
                        300 + (int)Math.Cos(angle + angle_a_incrementer*i), 
                        50 + (int)Math.Sin(angle + angle_a_incrementer*i), 
                        20, Color.Red
                    );
                }
 */

/*
            Raylib.InitWindow(600, 600, "Graph");

            Console.WriteLine((int)(250 * Math.Cos(angle_a_incrementer)));

            while (!Raylib.WindowShouldClose())
            {
                Raylib.BeginDrawing();
                Raylib.DrawCircle (
                        (int)(300 + 250*Math.Sin(angle + angle_a_incrementer)),
                        (int)(50 + 250*Math.Cos(angle + angle_a_incrementer)),
                        20, Color.Red
                    );
                Raylib.EndDrawing();
            }

            Raylib.CloseWindow();
            */