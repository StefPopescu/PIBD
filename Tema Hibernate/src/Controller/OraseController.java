package Controller;

import DAO.OraseDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Orase;
import DAOlmpl.OraseDaolmpl;

public class OraseController extends HttpServlet {

	Orase oras = new Orase();
	OraseDaolmpl orasDaolmpl = new OraseDaolmpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaOras") != null) {
			String nume = request.getParameter("nume");			
			oras.setNume(nume);
			orasDaolmpl.adaugaOrase(oras);
			RequestDispatcher rd = request.getRequestDispatcher("add_Oras.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaOrase") != null) {
			List<Orase> listaOrase = new ArrayList();
			listaOrase = orasDaolmpl.afiseazaOrase();
			request.setAttribute("listaOrase", listaOrase);
			RequestDispatcher rd = request.getRequestDispatcher("Orase.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaOras") != null) {
			int id1 = Integer.parseInt(request.getParameter("idoras"));
			String nume = request.getParameter("nume");
			orasDaolmpl.modificaOrase(id1, nume);
			RequestDispatcher rd = request.getRequestDispatcher("add_Oras.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeOras") != null) {
			int id2 = Integer.parseInt(request.getParameter("idoras"));
			oras.setIdoras(id2);
			orasDaolmpl.stergeOras(oras);
			RequestDispatcher rd = request.getRequestDispatcher("add_Oras.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}


